class Group < ApplicationRecord
  validates_presence_of :name, :id_of_group, :course
  has_many :schedules, dependent: :destroy
  has_many :lab_queues, dependent: :destroy
  has_many :users, dependent: :destroy
end

