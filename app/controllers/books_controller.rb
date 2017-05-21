class BooksController < ApplicationController
  def show
  end

  def search_result
    if user_signed_in?
      @shelf = current_user.shelf
      @user_books = @shelf.books
    end
    @search_word = params[:info]
    @books = Book.where('title LIKE(?) OR author LIKE(?)', "%#{params[:info]}%", "#{params[:info]}%").page(params[:page]).per(10)
  end
end
