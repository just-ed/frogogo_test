class Api::V1::AuthenticationController < Api::V1::BaseController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    @user = User.find_by_phone_number(params[:phone_number])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     phone_number: @user.phone_number }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:phone_number, :password)
  end
end
