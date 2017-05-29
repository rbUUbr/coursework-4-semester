class Schedule < ApplicationRecord
  belongs_to :group
  validates_presence_of :time, :subject, :week, :weeks_day, :subgroup
end
