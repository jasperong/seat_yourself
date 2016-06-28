class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def show
    @reservations = @user.reservations
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Successfully signed up and logged in!!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "Changes saved!"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "We are sorry to see you go :("
    redirect_to root_path
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :password, :password_confirmation)
  end
end
