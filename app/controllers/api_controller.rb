class ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

  before_action :require_login

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_api_user
    decoded_hash = decode_token
    if decoded_hash
      @current_user ||= User.find(decoded_hash['user_id'])
    else
      nil
    end
  end

  def require_login
    unless logged_in?
      render json: {error: "Unauthorized", message: "Please login"}, status: :unauthorized
    end
  end

  def logged_in?
    !!current_api_user
  end

  def auth_header
    request.headers['Authorization']
  end

  def endcode_token(payload)
    JWT.encode(payload, 'secret')
  end

  def decode_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        payload, _header = JWT.decode(token, 'secret', true, algorithm: 'HS256')
        payload
      rescue JWT::DecodeError
        {}
      end
    end
  end

  def not_found
    render json: {error: "Not Found", message: "Record does not exist"}, status: :not_found
  end

  def invalid_record(exception)
    render json: {error: "Invalid Record", message: exception.message}, status: :bad_request
  end
end
