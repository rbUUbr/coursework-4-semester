class SelectedQueue < ApplicationRecord
  belongs_to :user
  belongs_to :lab_queue, counter_cache: :users_count
end
