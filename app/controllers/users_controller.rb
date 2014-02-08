class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy]

  def index
    @users = User.all
    # Delete this after test
    @user = User.new
  end

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def destroy
    @user.destroy

    # Quick fix, get rid of it later... maybe?
    session[:user_id] = nil if @user.destroy

    respond_to do |format|
      format.html { redirect_to action: 'index'}
      format.js { render nothing: true }
    end
  end

  def create
    @user = User.new(users_params)

    respond_to do |format|
      if @user.save
        format.html {
          flash[:success] = "Welcome to Helping Hand, #{@user.name}!"
          session[:user_id] = @user.id
          redirect_to root_path
        }
        format.js {
          flash[:success] = "Welcome to Helping Hand, #{@user.name}!"
          session[:user_id] = @user.id
          redirect_to root_path
                  }
        format.json { render json: @user, status: :created, location: @user}
      else
        format.html { render action: 'new' }
        format.js { flash[:error] = "Boooooooo" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
