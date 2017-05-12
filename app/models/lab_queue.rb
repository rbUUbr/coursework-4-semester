class LabQueue < ApplicationRecord
  has_one :group
  belongs_to :schedule
  has_many :selected_queues, dependent: :destroy
  has_many :users, through: :selected_queues, dependent: :nullify
end
