class UsersController < ApplicationController

  before_action :set_user,except:[:index]

  def edit
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end

  def show
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

  def set_user
    @user = User.find(params[:id])
  end

end
