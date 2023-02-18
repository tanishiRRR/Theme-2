class BooksController < ApplicationController
  def books
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/books'
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  private
  # ストロングパラメータ
  def book_params
    params.permit(:title, :body)
  end
end
