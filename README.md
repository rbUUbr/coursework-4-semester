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
3. Run ```bundle install``` (it's can ask you for root privileges)
4. Run ```rake db:create ```
5. Run ```rake db:migrate ```
6. Run ```rake db:seed ``` - this is important step for parse schedules for all groups in BSUIR
7. Run ``` rails server(or rails s) ```
### Database information ###
Table  **Group** has many **Users** and **schedules**  
**Group** consists of:
* **id_of_group** - special number, which defines real number of the group(``` integer ```)
* **name** - real number of the group(```string```)
* **course** - information about course of group, for make correct queues (```integer```)  

**User** consists of:
* **email** - email information of user (```string```)
* **encrypted_password** - information of encrypted password(```string```)
* **reset_password_token** - token, that given for user for reset password(```string```)
* **group_id** - id of group(that in table of ids of BSUIR's API) for watching queues (```integer```)
* **reset_password_sent_at** - field, that registrate last time of changing password(```datetime```)
* **remember_created_at** - field, that using for remember time of registrating token(```datetime```)
* **sign_in_count** - count of signs in system(```integer```)
* **current_sign_in_at** - timestamp updated when the user signs in(```datetime```)
* **last_sign_in_at** -  holds the timestamp of the previous sign in(```datetime```)
* **current_sign_in_ip** - the remote ip updated when the user sign in(```inet```)
* **last_sign_in_ip** - holds the remote ip of the previous sign in(```inet```)
* **username** - string, that contains username(nickname) (```string```)  

**Schedule** consists of:
* **group_id** - same as in **Group**
* **subject** - name of the subject(```string```)
* **weeks** - array of weeks when held Labs(```array of integer```)
* **subgroup** - number of subgroup for lab(**0** for full group) (```integer```)
* **time** - time of lab work(```string```)

### TODO List ###
1. Make queues for all groups
2. Make registration on site
3. Make registration for queues
4. Enable SideKiq
