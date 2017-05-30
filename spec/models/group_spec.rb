require 'rails_helper'
RSpec.describe Group, type: :model do
  it "has a valid factory" do
    group = FactoryGirl.create :group
    expect(group).to be_valid
  end
  it { is_expected.to validate_presence_of(:id_of_group) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:course) }
end
