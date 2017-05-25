class BookShelvesController < ApplicationController
  before_action :set_current_user_shelf
  def create
    @book_shelf = BookShelf.create(book_id: params[:book_id], shelf_id: @shelf.id)
  end

  def destroy
    if @book_shelf = BookShelf.find_by(book_id: params[:book_id], shelf_id: @shelf.id)
      @book_shelf.delete
    else
      @book_shelf = BookShelf.find(params[:id])
      @book = @book_shelf.book
      @shelf = @book_shelf.shelf
      @review = Review.find_by(book_id: @book.id, shelf_id: @shelf.id)
      @book_shelf.delete
      @review.delete
      redirect_to book_path(@review.book)
    end
  end

  private
    def set_current_user_shelf
      @shelf = current_user.shelf
    end

    def book_shelf_params
      params.permit(:user_id)
    end
end
