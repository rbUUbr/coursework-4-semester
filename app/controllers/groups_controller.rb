class GroupsController < ApplicationController
  def index
		respond_with Group.all
	end
	
	private
	def group_params
		params.require(:group).permit(:id_of_group, :name)
	end
end
