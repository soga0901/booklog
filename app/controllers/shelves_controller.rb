class ShelvesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @shelf = @user.shelf
    @comment = Comment.new
    @comments = @shelf.comments.page(params[:page]).per(5).order("created_at DESC")
  end
end
