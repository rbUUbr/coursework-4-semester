class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  respond_to :json
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token
  def angular
    render "layouts/application"
  end
  private
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
