class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @user.username }, status: :ok
    else
      render json: { error: 'Usuário ou senha incorretos' }, status: :unauthorized
    end
  end

  def index
    render json: @current_user, serializer: UserSerializer, status: :ok
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
