require 'rails_helper'

RSpec.describe LabQueuesController, type: :controller do

  before(:each) do
    sign_in user
    FactoryGirl.create_list(:studio, 12, owner: user)
  end
  
end
