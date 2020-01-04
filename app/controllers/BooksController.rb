class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create!(params.require(:book).permit(*permitted))

    redirect_to books_path, :notice => "Book '#{@book.title} was successfully created!"
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update_attributes!(params.require(:book).permit(*permitted))

    redirect_to books_path, :notice => "Book '#{@book.title}' was successfully updated!"
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path, :notice => "Book '#{@book.title}' was successfully deleted!"
  end

  private

  def permitted
    [ :title, :genre, :isbn, :publish_date, :description ]
  end
end