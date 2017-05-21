class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :profile]

  def show
    @shelf = @user.shelf
    @books = @shelf.books
  end

  def profile
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
