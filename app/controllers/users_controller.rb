class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:ceate, :show, :profile]

  def show
  end

  def profile
  end

  def create
    binding.pry
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
