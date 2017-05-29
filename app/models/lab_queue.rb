class LabQueue < ApplicationRecord
  include PgSearch
  has_one :group
  belongs_to :schedule
  has_many :selected_queues, dependent: :destroy
  has_many :users, through: :selected_queues, dependent: :nullify

  scope :nearest_labs, lambda {
    where('date_of_lab >= ?', Date.today)
        .order('created_at DESC').reverse_order
  }

  pg_search_scope :search_by_subject, associated_against: { schedule: [:subject]}
end
