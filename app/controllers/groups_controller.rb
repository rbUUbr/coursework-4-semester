class GroupsController < ApplicationController
	def index
		groups = Group.all
		respond_with(groups) do |format|
			format.json {render :json => groups.as_json}
		end
	end
	
	private
	def group_params
		params.require(:group).permit(:id_of_group, :name)
	end
end
