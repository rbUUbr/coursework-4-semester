class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :html, :json

  before_action :configure_permitted_parameters, only: [:create, :update], if: :devise_controller?
  def create
    super
  end
  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname,
                                                       :email, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname,
                                                              :lastname, :email, :password, :password_confirmation])
  end
end
