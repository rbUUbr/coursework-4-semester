namespace :group_tasks do
  desc "TODO"
  task delete_groups_with_empty_schedules: :environment do
    Group.all.each do |group|
      if group.schedules == []
        puts "Deleted group #{group.name}, cause BSUIR's API has not schedule for it".colorize(:magenta)
        group.destroy
      end
    end
  end

end
