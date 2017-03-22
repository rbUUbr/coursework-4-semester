class GroupsController < ApplicationController
	before_action :authenticate_user!, only: [:create]
	def index
		respond_with Group.all.order("name")
	end
	private
	def group_params
		params.require(:group).permit(:id_of_group, :name, :schedules, :users)
	end
end
