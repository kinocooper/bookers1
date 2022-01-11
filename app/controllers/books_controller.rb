class BooksController < ApplicationController
  #def new
  #  @newBook = Book.new
  #end

  def index
    @books = Book.all
    @newBook = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to show_book_path(@book.id)
    else
      @books = Book.all #indexのviewページを再表示するためにレンディング前にインスタンスを再作成
      @newBook = @book #片方でもフォームに入力した内容を再表示するため、indexページのnewBookに代入
      render:index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to show_book_path(@book.id)
    else
      render:edit
    end
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
