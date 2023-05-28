class ApplicationController < ActionController::API
  include ActionController::Cookies

  before_action :authenticate_request

  private

  def authenticate_request
    render json: { error: "Unauthorized" }, status: :unauthorized unless current_user_id && authorized_user?
  end

  def authorized_user?
    current_user&.user? || current_user&.admin_clerk?
  end

  def current_user_id
    token = request.headers["Authorization"]&.split(" ")&.last
    decoded_token = decode(token)
    decoded_token&.dig(:user_id)
  end

  def current_user
    User.find_by(id: current_user_id)
  end

  def decode(token)
    decoded_token = JWT.decode(token, Rails.application.credentials.secret_key_base, true, algorithm: "HS256").first
    HashWithIndifferentAccess.new(decoded_token)
  rescue JWT::DecodeError, JWT::ExpiredSignature
    nil
  end
end
