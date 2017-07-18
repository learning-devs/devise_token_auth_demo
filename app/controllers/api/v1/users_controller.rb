class Api::V1::UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    render json: current_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end

end
