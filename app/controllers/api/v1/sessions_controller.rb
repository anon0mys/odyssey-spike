class Api::V1::SessionsController < ApiController
  skip_before_action :require_login, only: [:create]

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
       payload = {user_id: user.id}
       token = endcode_token(payload)
       render json: {user: user, jwt: token}
    else
       render json: {error: "Invalid Login", message: "Username or password invalid"}
    end
  end
end
