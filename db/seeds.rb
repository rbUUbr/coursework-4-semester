require 'open-uri'
URL_OF_PAGE_WITH_ALL_ID_OF_GROUPS = 'https://www.bsuir.by/schedule/rest/studentGroup'.freeze
START_OF_SEMESTER_OF_FIRST_AND_SECOND_COURSE = Date.parse('8th Feb 2017')
END_OF_SEMESTER_OF_FIRST_AND_SECOND_COURSE = Date.parse('31st May 2017')
def parse_groups
  all_groups_page = Nokogiri::XML(open(URL_OF_PAGE_WITH_ALL_ID_OF_GROUPS))
  all_groups_page.xpath('//studentGroup').each do |link|
    Group.create!(course: link.xpath('.//course').text.to_i,
                  id_of_group: link.xpath('.//id').text,
                  name: link.xpath('.//name').text)
  end
end


def parse_groups_schedules
  weeks = []
  groups_urls = []
  Group.find_each do |group|
    groups_urls << "https://www.bsuir.by/schedule/rest/schedule/#{group.id_of_group.to_s}"
  end
  Group.find_each do |group|
    begin
      url = "https://www.bsuir.by/schedule/rest/schedule/#{group.id_of_group.to_s}"
      puts "Started parsing #{url}"
      group_doc = Nokogiri::XML(open(url))
      week_day = ''
      group_doc.xpath('//scheduleModel').each do |link|
        link.xpath('.//schedule').each do |subject|
          if (subject.xpath('.//lessonType').text == 'ЛР')
            week_day = link.xpath('.//weekDay').text
            subject.xpath('.//weekNumber').each do |week|
              weeks.push(week.text)
            end
            group.schedules << Schedule.create!(
              subject: subject.xpath('.//subject').text,
              weeks: weeks, subgroup: subject.xpath('.//numSubgroup').text,
               time: subject.xpath('.//lessonTime').text,
              weeks_day: link.xpath('.//weekDay').text)
            weeks = []
          end
        end
      end
    rescue OpenURI::HTTPError => e
      if e.message == '404 Not Found'
        puts "Url #{url} not found ".colorize(:red)
      else
        raise e
      end
    end
    puts "Ended parsing #{url}".green
  end
end

def create_schedules
  current_date = START_OF_SEMESTER_OF_FIRST_AND_SECOND_COURSE
  current_week = 1
  while current_date < END_OF_SEMESTER_OF_FIRST_AND_SECOND_COURSE
    Group.find_each do |group|
      group.schedules.find_each do |schedule|
        if schedule.weeks.include?(current_week)
          LabQueue.create!(date: current_date, schedule_id: schedule.id, group_id: group.id)
        end
      end
    end
    current_week += 1
    current_date += 7
    current_week = 1 if current_week > 4
  end
end

puts "Started parsing #{URL_OF_PAGE_WITH_ALL_ID_OF_GROUPS}"
parse_groups
puts "Ended parsing #{URL_OF_PAGE_WITH_ALL_ID_OF_GROUPS}".green
parse_groups_schedules
create_schedules
puts 'Started perfoming rake tasks for clear groups with empty schedules in database'.red
Rake::Task['group_tasks:delete_groups_with_empty_schedules'].invoke
puts 'Finished perfoming rake task for delete groups with empty schedules'.green
puts 'Started perfoming rake tasks for clear schedules with empty weeks in database'.red
Rake::Task['group_tasks:delete_schedules_with_empty_weeks'].invoke
puts 'Finished perfoming rake tasks for clear schedules with empty weeks in database'.green
