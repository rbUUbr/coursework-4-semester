class UsersController < ApplicationController
  before_action :authenticate_user!
  load_resource :user

  def update
    @user.update(user_params)
    group = Group.find_by(name: params[:user][:group][:group_name])
    if group
      @user.group_id = group.id
      if @user.save
        redirect_to root_path
      end
    else
      redirect_to user_configure_profile_path(@user.id)
    end

  end

  def configure_profile
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password)
  end
end
