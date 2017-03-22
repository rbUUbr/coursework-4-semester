class Group < ApplicationRecord
  validates_presence_of :name, :id_of_group, :course
    has_many :schedules
    has_many :users
    def as_json(options = {})
        super(options.merge(include: [:schedules]))
    end
end

