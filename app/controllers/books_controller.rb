class BooksController < ApplicationController
  #def new
  #  @newBook = Book.new
  #end

  def index
    @books = Book.all
    @newBook = Book.new
  end

  def create
    @newBook = Book.new(book_params)
    if @newBook.save
      redirect_to show_book_path(@newBook.id)
    else
      @books = Book.all #indexのviewページを再表示するためにレンディング前にインスタンスを再作成
      render:index #エラーがあった場合はindexのviewページに戻す
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
      redirect_to show_book_path(@book.id) #対応するviewファイルがないのでshowのviewページへリダイレクト
    else
      render:edit #エラーがあった場合はeditのviewページに戻す
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
