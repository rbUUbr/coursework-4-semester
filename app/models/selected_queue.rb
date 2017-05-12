class SelectedQueue < ApplicationRecord
  belongs_to :user
  belongs_to :lab_queue, counter_cache: :count_of_additions_to_favorites
end
