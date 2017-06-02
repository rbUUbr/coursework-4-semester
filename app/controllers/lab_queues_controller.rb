class LabQueuesController < ApplicationController
  before_action :authenticate_user!, only: :registrate_on_lab
  load_and_authorize_resource

  def index
    if params[:query].present?
      @lab_queues = LabQueue.search_by_subject(params[:query])
    else
      if user_signed_in? && current_user.group.present?
        @lab_queues = current_user.group.lab_queues.nearest_labs
      else
        @lab_queues = LabQueue.all.sample(20)
      end
    end
  end

  def show
  end

  def search
    lab_queues = LabQueue.search_by_subject(params[:subject])
    render 'index', lab_queues
  end

end
