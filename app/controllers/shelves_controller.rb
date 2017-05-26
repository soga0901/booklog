class ShelvesController < ApplicationController
  def show
    @shelf = Shelf.find(params[:id])
    @user = User.find(params[:id])
    @comment = Comment.new
    @comments = @shelf.comments
  end
end
