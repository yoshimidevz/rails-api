class ApplicationController < ActionController::API
    include AuthHelper

  def render_result result
    if result.is_a?(Hash) && result[:error]
      render json: { error: result[:error] }, status: result[:code]
    else
      render json: result
    end
  end

  def authenticate_user
    token = request.headers['Authorization']&.split(' ')&.last
    decoded_token = decode_token(token)
    user_id = decoded_token['user_id']
    user = User.find_by(id: user_id)
    request.params.merge!(session_user: user)
  rescue JWT::ExpiredSignature
    render json: { error: "token expirado" }, status: 403
  rescue JWT::DecodeError
    render json: { error: "token inválido" }, status: 403
  end

  def params 
    request.params
  end
end