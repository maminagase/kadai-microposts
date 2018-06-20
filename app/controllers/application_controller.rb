class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :require_user_logged_in, only: [:index, :show]
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_microposts = user.microposts.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
  end
  
end
