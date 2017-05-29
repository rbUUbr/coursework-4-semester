class SelectedQueuesController < ApplicationController
  before_action :authenticate_user!
  load_resource :user
  load_and_authorize_resource through: :user, only: :index
  def index
    @lab_queues = current_user.selected_queues
  end
  def destroy
    @selected_queue.destroy
  end
end
