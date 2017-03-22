require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  context "when using index action" do
    it 'should 200' do
      expect(response.status).to eq(200)
    end
  end
  context "GET index" do
    it "renders index template" do
      get "/groups.json"
      json = JSON.parse(response.body)
      expect(json).to be_success
    end
  end
end
