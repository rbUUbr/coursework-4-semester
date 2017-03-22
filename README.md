### About ###

 This is my application for generating queues for labs in BSUIR, using BSUIR's API. 

### System information ###
* Ruby version: 2.4.0

* Ruby framework: Ruby on Rails
* Database: PostgreSQL

* Client part: AngularJS, v 1.5

* Used gems and libraries:
  > Ruby 
  >> devise  
  >> angular-rails-templates  
  >> responders  
  >> colorize  
  >> nokogiri  
  >
  > Javascript:
  >> angular-ui-router  
  >> AngularDevise  
  >> isteven-angular-multiselect  
  >
### Installation ###
1. Install Ruby, RVM, Rails, npm, bower
2. Go to directory
3. Run ```rake db:create ```
4. Run ```rake db:migrate ```
5. Run ```rake db:seed ``` - this is important step for parse schedules for all groups in BSUIR
6. Run ``` rails server(or rails s) ```
### Database information ###
Table  **Group** has many **Users** and **schedules**
**Group** consists of:
* **id_of_group** - special number, which defines real number of the group(``` integer ```)
* **name**
### TODO List ###
1. Make queues for all groups
2. Make registration on site
3. Make registration for queues
4. Enable SideKiq
