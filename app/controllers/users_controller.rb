class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to action: 'index'
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to action: 'index'
      flash[:notice] = "Account created!"
    else
      render 'new'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # Strong params
  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
