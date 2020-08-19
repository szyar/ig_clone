class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def page_title
    "Instagram"
  end

  def index
    @posts = Post.all
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if params[:back]
      render :new
    else
      if @post.save
        flash[:notice] = "post Created"
        redirect_to @post
      else
        render 'new'
      end
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Edited Successfully"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Deleted Successfully"
      redirect_to posts_path
    end
  end

  def confirm
    @post = Post.new(post_params)
    @post.user = current_user
    render 'new' if @post.invalid?
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:caption, :picture, :picture_cache, :user_id)
  end

  def require_same_user
    if current_user != @post.user
      flash[:alert] = "You can only edit or delete your own posts"
      redirect_to @post
    end
  end

end
