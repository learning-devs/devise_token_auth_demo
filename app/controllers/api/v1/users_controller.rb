class Api::V1::UsersController < ApplicationController

  def index
    if user_signed_in?
      render json: current_user
    else
      render json: { errors: 'No hay un usuario autenticado.' }
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end

end
