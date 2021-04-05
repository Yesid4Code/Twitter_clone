class UsersController < ApplicationController
  include UserScoped

  def show
    @tweets = @user.tweets.paginate(page: params[:page], per_page: 10)
    @users = User.all
  end

end
