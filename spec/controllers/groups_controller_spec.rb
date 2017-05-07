require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  context "when using index action" do
    it 'should 200' do
      expect(response.status).to eq(200)
    end
  end
  context "GET index" do
    it "renders index template" do
      get :index, format: json
      json = JSON.parse(response.body)
      expect(json).to be_success
    end
  end
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'does create a new group' do
        post :create, params: { group: attributes_for(:group) }
        expect(Group.count).to eq(1)
      end
    end
  end
end
