# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
URL_OF_PAGE_WITH_ALL_ID_OF_GROUPS = "https://www.bsuir.by/schedule/rest/studentGroup"
all_groups_page = Nokogiri::XML(open(URL_OF_PAGE_WITH_ALL_ID_OF_GROUPS))
 my_group_doc = Nokogiri::HTML(open("https://www.bsuir.by/schedule/schedule.xhtml?id=551006"))