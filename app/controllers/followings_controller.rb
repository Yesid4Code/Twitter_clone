class FollowingsController < ApplicationController
  include UserScoped

  def index
    @user_followings = @user.following.paginate(page: params[:page], per_page: 10)
  end
end
