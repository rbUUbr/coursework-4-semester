class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :html, :json

  before_action :configure_permitted_parameters, only: [:create, :update], if: :devise_controller?

  def create
    super
    @user.group_id = Group.find_by(name: params[:user][:group][:group_name]).id if params[:user][:group][:group_name]
    @user.save

  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,
                                                       :email, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name,
                                                              :last_name, :email, :password, :password_confirmation])
  end
end
