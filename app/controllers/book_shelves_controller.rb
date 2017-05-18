class BookShelvesController < ApplicationController
  def create
    binding.pry
    @shelf = current_user.shelf
    BookShelf.create(book_id: params[:book_id], shelf_id: @shelf.id)
  end

  private
    def book_shelf_params
      params.permit(:user_id)
    end
end
