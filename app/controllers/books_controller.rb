class BooksController < ApplicationController
  def search_result
    @search_word = params[:info]
    @books = Book.where('title LIKE(?) OR author LIKE(?)', "%#{params[:info]}%", "#{params[:info]}%").page(params[:page]).per(10)
  end
end
