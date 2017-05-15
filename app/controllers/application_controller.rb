class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :create_shelf

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys:[:name])
  end

  private
  def create_shelf
    if user_signed_in? && !(current_user.shelf)
      Shelf.create(name: current_user.name + "の本棚", user_id: current_user.id)
    end
  end
end
