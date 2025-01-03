class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to 
    else
      render :new
    end
  end
end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
