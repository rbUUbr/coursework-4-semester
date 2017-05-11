class LabQueuesController < ApplicationController
  before_action :authenticate_user!
  def index
    binding.pry
    @lab_queues = current_user.group.lab_queues
  end
  def registrage_on_lab

  end
end
