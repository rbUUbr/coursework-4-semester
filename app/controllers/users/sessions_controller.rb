class Users::SessionsController < Devise::SessionsController
  respond_to :html, :json

  protected

  def after_sign_in_path_for(resource)
    if !current_user.group.present?
      user_configure_profile_path(current_user.id)
    end
  end
end
