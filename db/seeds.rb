# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

URL_OF_PAGE_WITH_ALL_ID_OF_GROUPS = "https://www.bsuir.by/schedule/rest/studentGroup"
MY_GROUP_PAGE = "https://www.bsuir.by/schedule/rest/schedule/21381"
def parse_groups
  all_groups_page = Nokogiri::XML(open(URL_OF_PAGE_WITH_ALL_ID_OF_GROUPS))
  all_groups_page.xpath("//studentGroup").each do |link|
    Group.create(id_of_group: link.xpath(".//id").text, name: link.xpath(".//name").text)
  end
end
def parse_my_group
  example_group = Group.find_by(name: "551006")
  my_group_doc = Nokogiri::XML(open("https://www.bsuir.by/schedule/rest/schedule/21381"))
  my_group_doc.xpath("//scheduleModel").each do |link|
    link.xpath(".//schedule").each do |subject|
      if (subject.xpath(".//lessonType").text == "ЛР")
        example_group.schedules << Schedule.create(subject: subject.xpath(".//subject").text, weeks: subject.xpath(".//weekNumber").text, subgroup: subject.xpath(".//numSubgroup").text, time: subject.xpath(".//lessonTime").text)
      end 
    end
  end
end
puts "Started parsing #{URL_OF_PAGE_WITH_ALL_ID_OF_GROUPS}"
parse_groups
puts "Ended parsing #{URL_OF_PAGE_WITH_ALL_ID_OF_GROUPS}".green
puts "Started parsing #{MY_GROUP_PAGE}"
parse_my_group
puts "Ended parsing #{MY_GROUP_PAGE}"