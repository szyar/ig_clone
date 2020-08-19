class FavoritesController < ApplicationController

  def page_title
    "Instagram"
  end

  def index
    @favorite = current_user.favorites.all
    @user = current_user
    @posts = @user.posts
  end

  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to post_path(params[:post_id]), notice: "Add to favorites"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to posts_path, notice: "Remove from favorites"
  end

end
