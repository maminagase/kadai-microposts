class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = 'likeしました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'likeを解除しました。'
    redirect_back(fallback_location: root_url)
  end 
  
  
  def likes
    @favolite_microposts = current_user.favorite_microposts
  end


end
