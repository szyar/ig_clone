class UsersController < ApplicationController

  def page_title
    "Instagram"
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username}, you have successfully signed up"
      redirect_to @user
    else
      render 'new'
    end
  end

end
