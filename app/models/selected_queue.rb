class SelectedQueue < ApplicationRecord
  belongs_to :user
  belongs_to :lab_queues, counter_cache: :count_of_additions_to_favorites
end
