class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :notifications
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :notifications, unless: :devise_controller?

  # @return [User]
  def current_user
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def notifications
    @pending_friendship = User.where(id: current_user.pending_acceptance)
  end
end
