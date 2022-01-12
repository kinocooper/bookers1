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
       #対応するviewファイルがないのでshowのviewページへリダイレクト
      redirect_to show_book_path(@newBook.id),notice: 'Book was successfully created.'
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
       #対応するviewファイルがないのでshowのviewページへリダイレクト
      redirect_to show_book_path(@book.id),notice: 'Book was successfully updated.'
    else
      render:edit #エラーがあった場合はeditのviewページに戻す
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    #対応するviewファイルがないのでindexのviewページへリダイレクト
    redirect_to index_path,notice: 'Book was successfully deleted.'
  end

  private
    def book_params
      params.require(:book).permit(:title,:body)
    end
end
