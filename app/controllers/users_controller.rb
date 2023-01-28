class UsersController < ApplicationController
  def edit
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def index
  end
end
