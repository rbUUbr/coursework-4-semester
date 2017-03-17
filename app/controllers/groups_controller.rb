class GroupsController < ApplicationController
	before_filter :authenticate_user!, only: [:create]
	def index
		respond_with Group.all
	end
	private
	def group_params
		params.require(:group).permit(:id_of_group, :name, :schedules, :users)
	end
end
