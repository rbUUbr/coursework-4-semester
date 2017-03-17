class Group < ApplicationRecord
    has_many :schedules
    def as_json(options = {})
        super(options.merge(include: [:schedules]))
    end
end
