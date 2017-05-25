class ReviewsController < ApplicationController

  def create
    @review = Review.create(book_id: params[:book_id], user_id: current_user.id, shelf_id: current_user.shelf.id)
    respond_to do |format|
      format.json { render 'create', handlers: 'jbuilder' }
    end
  end

  def destroy
    @review = Review.find_by(book_id: params[:book_id], shelf_id: current_user.shelf.id)
    @review.delete
  end

  def edit
    @review = Review.find(params[:id])
    @book = @review.book
    @shelf = current_user.shelf
    @book_shelf = BookShelf.find_by(book_id: @book.id, shelf_id: @shelf.id)

  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    if @review.save
      respond_to do |format|
        format.html { redirect_to book_path(@review.book) }
        format.json
      end
    end
  end

  def review_params
    params.require(:review).permit(:text)
  end

end
