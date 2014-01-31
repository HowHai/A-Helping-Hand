class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to action: 'new'
      flash[:notice] = "Account created!"
    else
      render 'new'
    end
  end

  private

  # Strong params
  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
