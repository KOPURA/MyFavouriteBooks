class BooksController < ApplicationController

  def index
    @sorting = get_sorting
    @selected_genres = get_selected_genres

    if 'title' == @sorting
      ordering_hash, @title_class = {title: :asc}, 'sortedBy'
    elsif 'publish_date' == @sorting
      ordering_hash, @publish_date_class = {publish_date: :asc}, 'sortedBy'
    end

    session[:sort_by] = @sorting
    session[:genres] = @selected_genres

    @books = Book.where(genre: @selected_genres).order(ordering_hash)
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
    if @book.update(params.require(:book).permit(*permitted))
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

  def reset
    reset_session

    redirect_to books_path
  end

  def same_author
    @book = Book.find(params[:id])
    if !@book.author.present?
      return redirect_to books_path, :alert => "'To Kill A Mockingbird' has no author info"
    end
    @books = Book.where(author: @book.author)
  end

  private

    def permitted
      [ :title, :genre, :author, :isbn, :publish_date, :description ]
    end

    def get_sorting
      sorting = params[:sort_by] || session[:sort_by]
      return nil if !['title', 'publish_date'].include? sorting
      return sorting
    end

    def get_selected_genres
      genres = params.permit(Book::ALL_GENRES).keys
      genres = (session[:genres] || []) if genres.empty?
      genres = Book::ALL_GENRES if genres.empty?
      return genres
    end
end