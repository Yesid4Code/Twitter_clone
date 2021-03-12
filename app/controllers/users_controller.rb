class UsersController < ApplicationController
  # before_action :set_user, only: [:show]

  # def index
  # end

  def show
    @user = User.find(params[:id])
  end

  def following
    @users = User.all
  end
  
  def followers
    @users = User.all
  end
  # def set_user
  #  @user = User.find(params[:id])
  # end

  # def user_params
  #  params.require(:user).permit(:name, :username)
  # end
end
