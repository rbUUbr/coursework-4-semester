# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'open-uri'
URL_OF_PAGE_WITH_ALL_ID_OF_GROUPS = "https://www.bsuir.by/schedule/rest/studentGroup"
MY_GROUP_PAGE = "https://www.bsuir.by/schedule/rest/schedule/21381"
def parse_groups
  all_groups_page = Nokogiri::XML(open(URL_OF_PAGE_WITH_ALL_ID_OF_GROUPS))
  all_groups_page.xpath("//studentGroup").each do |link|
    Group.create(id_of_group: link.xpath(".//id").text, name: link.xpath(".//name").text)
  end
end


def parse_my_group
  weeks = []
  groups_urls = []
  Group.all.each do |group|
    groups_urls << "https://www.bsuir.by/schedule/rest/schedule/#{group.id_of_group.to_s}"
  end
  Group.all.each do |group|
    groups_urls.each do |url|
      begin
        puts "Started parsing #{url}"
        group_doc = Nokogiri::XML(open(url))
        group_doc.xpath("//scheduleModel").each do |link|
          link.xpath(".//schedule").each do |subject|
            if (subject.xpath(".//lessonType").text == "ЛР")
              subject.xpath(".//weekNumber").each do |week|
                weeks.push(week.text)
              end
              group.schedules << Schedule.create(subject: subject.xpath(".//subject").text, weeks: weeks, subgroup: subject.xpath(".//numSubgroup").text, time: subject.xpath(".//lessonTime").text)
              weeks = []
            end
          end
        end
      rescue OpenURI::HTTPError => e
        if e.message == '404 Not Found'
          puts "Url #{url} not found :c".colorize(:red)
        else
          raise e
        end
      end
      puts "Ended parsing #{url}".green
    end
  end
end
puts "Started parsing #{URL_OF_PAGE_WITH_ALL_ID_OF_GROUPS}"
parse_groups
puts "Ended parsing #{URL_OF_PAGE_WITH_ALL_ID_OF_GROUPS}".green
parse_my_group