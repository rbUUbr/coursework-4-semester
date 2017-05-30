require 'rails_helper'

RSpec.describe LabQueuesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:schedule) { FactoryGirl.create(:schedule) }
  before(:each) do
    sign_in user
    FactoryGirl.create_list(:lab_queue, 12, schedule: schedule)
  end
  describe 'GET #index' do
    it 'should render the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end
