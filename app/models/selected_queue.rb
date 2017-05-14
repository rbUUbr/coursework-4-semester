class SelectedQueue < ApplicationRecord
  belongs_to :user
  belongs_to :lab_queue, counter_cache: :users_count

  before_destroy :update_states

  private

  def update_states
    queues = SelectedQueue.where(lab_queue_id: self.lab_queue_id ).select do |element|
      element.user_position != 1
    end
    queues.each do |queue|
      queue.update_attribute(:user_position, queue.user_position - 1)
    end
  end
end
