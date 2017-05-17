class LabQueuesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @lab_queues = current_user.group.lab_queues.nearest_labs
    @filterrific = initialize_filterrific(
        LabQueue,
        params[:filterrific],
        select_options: {
            sorted_by: LabQueue.options_for_sorted_by,
            with_country_id: Country.options_for_select
        },
        persistence_id: 'shared_key',
        default_filter_params: {},
        available_filters: [],
    ) or return
  end

  def show
  end

  def registrate_on_lab
    find_queue_in_selected
    if @selected_queue
      @selected_queue.destroy
    else
      lab_queue = LabQueue.find_by(id: params[:lab_queue_id])
      SelectedQueue.create(user_id: current_user.id,
                          lab_queue_id: lab_queue.id,
                          user_position: lab_queue.users_count + 1)
    end
    redirect_to root_path
  end

  private

  def find_queue_in_selected
    @selected_queue = current_user.selected_queues.find_by(lab_queue_id:
                                                                 params[:lab_queue_id])
  end
end
