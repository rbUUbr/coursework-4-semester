# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
 my_group_doc = Nokogiri::HTML(open("https://www.bsuir.by/schedule/schedule.xhtml?id=551006"))
 lessons = []
 times  = []
 my_group_doc.css("span").each do |link|
   lessons << link.content if link.text.strip.include?("(ЛР)")
 end
 my_group_doc.css("td").each do |link|
      times << link.content.delete(" ").gsub(/\n/, '') if /^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]-([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/.match(link.text.strip)
 end
 File.write("/home/rbudeveloper/course_work_4_semester/db/db.txt", lessons)
 File.write("/home/rbudeveloper/course_work_4_semester/db/db.txt", times)
