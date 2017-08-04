class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # helper_method :current_user

  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

  protected

  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :user_name, :phone_number, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    sign_in_attrs = [:login,:password]
    devise_parameter_sanitizer.permit :sign_in, keys: sign_in_attrs

    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
