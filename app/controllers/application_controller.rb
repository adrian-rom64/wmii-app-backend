class ApplicationController < ActionController::API
  before_action :authenticate, except: :info
  helper_method :full_url

  def info
    render json: {online: true}
  end

  def full_url(image)
    return nil unless image.url
    request.base_url + image.url.to_s
  end

  def authenticate
    result = authenticate!
    return true if result == :ok
    render json: {error: result}, status: :unauthorized
    return false
  end

  private

  def token_params
    {
      user_id: @user.id,
      exp: (Time.now + 1.hours).to_i
    }
  end

  def authenticate!
    return 'token not present' unless token.present?

    payload = auth_payload
    return 'token expired' if payload == :expired
    return 'token invalid' if payload == :invalid_token

    user = User.find(payload['user_id'])
    $current_user = user
    return 'user not found' unless user

    return :ok
  end

  def auth_payload
    begin
      JWT.decode(
        token,
        Rails.application.credentials.secret_key_base,
        true,
        { algorithm: 'HS256' }
      ).first
    rescue JWT::DecodeError
      :invalid_token
    rescue JWT::ExpiredSignature
      :expired
    rescue JWT::VerificationError
      :invalid_token
    end
  end

  def token
    header = request.headers['Authorization']
    @token ||= header.present? && header.split(' ').last
  end

end
