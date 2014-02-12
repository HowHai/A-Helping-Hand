class AuthsController < ApplicationController

  def new
    if current_user
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    user = User.find_by(name: params[:user][:name])

    if user && user.authenticated?(params[:user][:password])
      # respond_to do |format|
      #   format.html { session[:user_id] = user.id }
      #   format.js {
      #     session[:user_id] = user.id
      #     flash[:success] = "Hello #{user.name}"
      #   }
      session[:user_id] = user.id
      redirect_to root_path
      # end
    else
      redirect_to new_auth_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
