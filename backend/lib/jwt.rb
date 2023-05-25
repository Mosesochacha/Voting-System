module JWTAuthentication
  def encode(payload)
    JWT.encode(payload, Rails.application.credentials.secret_key_base, "HS256")
  end

  def decode(token)
    decoded_token = JWT.decode(token, Rails.application.credentials.secret_key_base, true, algorithm: "HS256").first
    HashWithIndifferentAccess.new(decoded_token)
  rescue JWT::DecodeError, JWT::ExpiredSignature
    nil
  end
end
