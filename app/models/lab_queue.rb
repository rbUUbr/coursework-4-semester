class LabQueue < ApplicationRecord
  has_one :group
  belongs_to :schedule
  has_many :selected_queues, dependent: :destroy
  has_many :users, through: :selected_queues, dependent: :nullify

  filterrific(
    default_filter_params: { sorted_by: ("date >= #{Date.today}") },
    available_filters: [
        :sorted_by,
        :search_query,
        :with_subject,
        :with_created_at_gte
    ]
  )

  scope :search_query, lambda { |query|
    # Filters students whose name or email matches the query
  #  ...
  }

  scope :sorted_by, lambda { |sort_key|
    # Sorts students by sort_key
  #  ...
  }

  scope :with_subject, lambda { |subject_ids|
    # Filters students with any of the given country_ids
   # ...
  }

  scope :nearest_labs, lambda {
    where('date >= ?', Date.today)
        .order('created_at DESC').reverse_order
  }
end
