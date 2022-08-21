class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
    else
      @books = Book.all
      render 'index'
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @showbook = Book.new
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
