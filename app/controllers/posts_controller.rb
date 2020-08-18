class PostsController < ApplicationController

  def page_title
    "Instagram"
  end

  def new
    @post = Post.new
  end
end
