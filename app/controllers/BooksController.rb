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
    @book = Book.new(params.require(:book).permit(*permitted))
    if @book.save
      redirect_to books_path, :notice => "Book '#{@book.title} was successfully created!"
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params.require(:book).permit(*permitted))
      redirect_to books_path, :notice => "Book '#{@book.title}' was successfully updated!"
    else
      render 'edit'
    end
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