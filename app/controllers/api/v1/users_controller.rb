class Api::V1::UsersController < ApiController
  skip_before_action :require_login, only: [:create]

  def create
    user = User.create!(user_params)
    payload = {user_id: user.id}
    token = endcode_token(payload)
    render json: {user: user, jwt: token}
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
