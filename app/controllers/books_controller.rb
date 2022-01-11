class BooksController < ApplicationController
  #def new
  #  @newBook = Book.new
  #end

  def index
    @books = Book.all
    @newBook = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to show_book_path(book.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to show_book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to index_path
  end

  private
    def book_params
      params.require(:book).permit(:title,:body)
    end
end
