class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :get_notifications
  before_action :configure_permitted_parameters, if: :devise_controller?

  # @return [User]
  def current_user
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def get_notifications
    @pending_friendship = User.where(id: current_user.pending_acceptance)
  end
end
