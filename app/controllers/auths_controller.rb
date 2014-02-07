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
    if user.authenticated?(params[:user][:password])
      # respond_to do |format|
      #   format.html { session[:user_id] = user.id }
      #   format.js { session[:user_id] = user.id}
      # end
      session[:user_id] = user.id
      flash[:success] = "Hello #{user.name}"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Bye!"
    redirect_to root_path
  end
end
