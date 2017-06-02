class SelectedQueuesController < ApplicationController
  before_action :authenticate_user!
  load_resource :user
  load_and_authorize_resource through: :user, only: :index

  def index
    @lab_queues = current_user.selected_queues
  end

  def registrate_on_lab
    find_queue_in_selected
    lab_queue = LabQueue.find_by(id: params[:lab_queue_id])
    respond_to do |f|
      if @selected_queue
        @selected_queue.destroy
        f.js { render body: nil, status: :ok }
        f.html { redirect_to(:back) }
      else
        SelectedQueue.create(user_id: current_user.id,
                            lab_queue_id: params[:lab_queue_id],
                            user_position: lab_queue.users_count + 1)
        f.js { render body: nil, status: :ok }
      end
    end
  end

  private

  def find_queue_in_selected
    @selected_queue = current_user.selected_queues.find_by(lab_queue_id:
                                                                 params[:lab_queue_id])
  end

end
