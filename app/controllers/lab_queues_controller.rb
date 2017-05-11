class LabQueuesController < ApplicationController
  before_action :authenticate_user!
  def index
    @lab_queues = current_user.group.lab_queues
  end
  def registrage_on_lab
    find_queue_in_selected
    if @selected_queue
      @selected_queue.destroy
    else
      SelectedQueue.create(user_id: current_user.id,
                            lab_queue_id: params[:lab_queue_id])
    end
  end

  private

  def find_queue_in_selected
    @selected_queue = current_user.selected_queues.find_by(lab_queue_id:
                                                                 params[:lab_queue_id])
  end
end
