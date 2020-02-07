class AuthController < ApplicationController
  skip_before_action :authenticate, only: :login

  def login
    @user = User.find_by(email: params[:email])
    if @user&.valid_password?(params[:password])
      secret = Rails.application.credentials.secret_key_base
      token = JWT.encode(token_params, secret, 'HS256')
      render json: {token: token}, status: :ok
    else
      render json: { errors: 'invalid_credentials' }, status: :unauthorized
    end
  end

end
