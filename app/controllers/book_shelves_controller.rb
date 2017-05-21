class BookShelvesController < ApplicationController
  before_action :set_current_user_shelf
  def create
    BookShelf.create(book_id: params[:book_id], shelf_id: @shelf.id)
  end

  def destroy
    @book_shelf = BookShelf.find_by(book_id: params[:book_id], shelf_id: @shelf.id)
    @book_shelf.delete
  end

  private
    def set_current_user_shelf
      @shelf = current_user.shelf
    end

    def book_shelf_params
      params.permit(:user_id)
    end
end
