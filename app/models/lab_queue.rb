class LabQueue < ApplicationRecord
  has_one :group
  belongs_to :schedule
  has_many :selected_queues, dependent: :destroy
  has_many :users, through: :selected_queues, dependent: :nullify

  scope :nearest_labs, lambda {
    where('date >= ?', Date.today)
        .order('created_at DESC').reverse_order
  }
end
