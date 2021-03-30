class FollowersController < ActionController::Base
  include UserScoped

  def index
    @user_followers = @user.followers.paginate(page: params[:page], per_page: 10)
  end
end
