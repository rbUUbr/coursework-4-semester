class SelectedQueuesController < ApplicationController
  load_and_authorize_resource
  def destroy
    @selected_queue.destroy
  end
end