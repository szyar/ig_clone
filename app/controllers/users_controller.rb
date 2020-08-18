class UsersController < ApplicationController

  def page_title
    "Instagram"
  end

  def index
    @users = User.all
  end

  def show
    
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

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
