class Group < ApplicationRecord
    has_many :schedules
    has_many :users
    def as_json(options = {})
        super(options.merge(include: [:schedules, :users]))
    end
end

