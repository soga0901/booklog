class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews.order('created_at DESC')
    if user_signed_in?
      @shelf = current_user.shelf
      if @book.reviews.find_by(user_id: current_user.id)
        @review = Review.find_by(book_id: @book.id, user_id: current_user.id)
      end
    end
  end

  def search_result
    @review = Review.new
    if user_signed_in?
      @shelf = current_user.shelf
      @user_books = @shelf.books
    end
    @search_word = params[:info]
    @books = Book.where('title LIKE(?) OR author LIKE(?)', "%#{params[:info]}%", "#{params[:info]}%").page(params[:page]).per(10)
  end

  private
  def set_current_shelf
    @shelf = current_user.shelf
  end

end
