class UsersController < ApplicationController
  before_action :authenticate_request, except: [:authenticate, :destroy, :create]
  before_action :check_blocked_status, only: [:authenticate]

  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    users = User.all
    render json: users
  end

  def authenticate
    user = User.find_by(email: params[:email])

    if user.nil?
      user_not_found
    elsif user.authenticate(params[:password])
      reset_failed_attempts(user)
      token = encode({ user_id: user.id, email: user.email, status: user.blocked? })

      role_message = case user.role
        when "admin"
          "Welcome, Admin!"
        when "clerk"
          "Welcome, Clerk!"
        else
          "Welcome, User!"
        end

      render json: { token: token, message: role_message }, status: :ok
    else
      increment_failed_attempts(user)
      if user.failed_login_attempts >= 3
        user.update(blocked: true)
        render json: { error: "Account blocked. Please contact the administrator." }, status: :unauthorized
      else
        render json: { errors: "Invalid password" }, status: :unauthorized
      end
    end
  rescue => e
    render json: { error: "Login failed" }, status: :bad_request
  end

  def create
    begin
      user = User.new(user_params)
      user.password = params[:password]
      user.password_confirmation = params[:password_confirmation]
      user.save!
      token = encode({ user_id: user.id, email: user.email })
      render json: { token: token, user: user }, status: :created
    rescue ActiveRecord::RecordInvalid => e
      render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    rescue ActiveRecord::RecordNotUnique => e
      render json: { errors: [e.message] }, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: current_user_id)
    render json: user
  end

  def destroy
    token = nil
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def record_invalid(invalid)
    render json: { errors: invalid }, status: :unprocessable_entity
  end

  def user_not_found
    render json: { errors: "Account not found for that email address" }, status: :not_found
  end

  def not_found
    render json: { error: "User Not Found" }, status: :unauthorized
  end

  def current_user_id
    token = request.headers["Authorization"]&.split(" ")&.last
    decoded_token = decode(token)
    decoded_token&.dig(:user_id)
  end

  def encode(payload)
    JWT.encode(payload, Rails.application.credentials.secret_key_base, "HS256")
  end

  def decode(token)
    decoded_token = JWT.decode(token, Rails.application.credentials.secret_key_base, true, algorithm: "HS256").first
    HashWithIndifferentAccess.new(decoded_token)
  rescue JWT::DecodeError, JWT::ExpiredSignature
    nil
  end

  def authenticate_request
    render json: { error: "Unauthorized" }, status: :unauthorized unless current_user_id
  end

  def check_blocked_status
    user = User.find_by(email: params[:email])

    if user&.blocked?
      render json: { errors: "Account blocked. Please contact the administrator." }, status: :unauthorized
    end
  end

  def increment_failed_attempts(user)
    user.update(failed_login_attempts: user.failed_login_attempts + 1)
  end

  def reset_failed_attempts(user)
    user.update(failed_login_attempts: 0)
  end
end
