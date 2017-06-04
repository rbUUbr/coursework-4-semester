class Users::SessionsController < Devise::SessionsController
  respond_to :html, :json

  protected

  def after_sign_in_path_for(resource)
    if !resource.group_id.present?
      edit_user_path(current_user.id)
    else
      root_path
    end
  end
end
