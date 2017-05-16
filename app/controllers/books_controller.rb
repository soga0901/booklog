class BooksController < ApplicationController
  def index
    binding.pry
    @books = Book.all.page(params[:page]).per(10)
  end
end
