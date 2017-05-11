class LabQueuesController < ApplicationController
  load_resource :user
  load_and_authorize_resource
  def index
  end
end
