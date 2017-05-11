class LabQueue < ApplicationRecord
  has_one :schedule
  belongs_to :group
end
