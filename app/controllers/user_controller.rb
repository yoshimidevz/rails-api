class UserController < ApplicationController
  before_action :authenticate_user, only: [:get_info]

  def get_info
    data = params[:session_user].slice(:name, :email, :created_at)
    render json: { user: data }, status: 200
  end
end