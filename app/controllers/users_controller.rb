class UsersController < ApplicationController

  before_action :ensure_user,only:[:edit,:update]

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.find(current_user.id)
    @users = User.all
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

  def ensure_user
    @user = User.find_by(id: params[current_user])
    redirect_to  users_path unless @user
  end

end
