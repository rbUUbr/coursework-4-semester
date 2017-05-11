class LabQueue < ApplicationRecord
  has_one :schedule
  belongs_to :group
  has_many :selected_queues, dependent: :destroy
  has_many :users, through: :selected_queues, dependent: :nullify
end
