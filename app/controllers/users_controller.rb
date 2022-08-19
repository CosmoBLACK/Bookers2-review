class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @book = Book.new
  end
end
