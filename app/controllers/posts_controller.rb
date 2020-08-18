class PostsController < ApplicationController

  def page_title
    "Instagram"
  end

  def new
    @post = Post.new
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

  def confirm
    @post = Post.new(post_params)
    @post.user = current_user
    render 'new' if @post.invalid?
  end

  private

  def post_params
    params.require(:post).permit(:caption, :picture, :picture_cache, :user_id)
  end

end
