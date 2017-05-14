namespace :group_tasks do
  desc "Delete schedules, that has not weeks(Error of BSUIR's API)"
  task delete_schedules_with_empty_weeks: :environment do
    Group.all.each do |group|
      if group.schedules == []
        puts "Deleted group #{group.name}, cause BSUIR's API has not schedule for it".colorize(:magenta)
        group.destroy
      end
    end
  end

  desc "Delete all Groups with empty schedules(Error of BSUIR's API)"
  task delete_groups_with_empty_schedules: :environment do
    Schedule.all.each do |schedule|
      puts "Deleting #{schedule.subject} of #{Group.find(schedule.group_id).name}'s cause it hasn't weeks"
      if schedule.week == 0
        puts "Deleting #{schedule.subject} of #{Group.find(schedule.group_id).name}'s cause it hasn't weeks"
        schedule.destroy
      end
    end
  end

end
