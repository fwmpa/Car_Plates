# Car-Plates
Project developed for a Ruby on Rails code challenge that performs CRUD functions for vehicle registration plates.

It allows users to register, edit and delete car plates.

To register a new car plate, the user must fill a form with the following data: 
* Plate
* Owner name
* Car model
* Car year

### Project structure features
The project has service folder containing individual files which are responsible for storing each controller method logic.

Built using [PostgreSQL](https://www.postgresql.org/) database. 

### Registration and Editing Rules
**1. "Plate" must be present, 7 characters long and unique**

  * The usual ID for the Car Plate entity is exchanged for it's plate code. So, in order to succeed a registration, the user must provide a plate code and it must be an non existing one. Not only that, accordingly to the brazilian license plate standards, the plate code must be exactly 7 characters long.
      
  * If your plate code contains alphabetic characters, do not worry about capitalization, every character will be automatically capitalized before being stored into database. 

**2. If provided, "Year" must be a 4 digit number**
  * Year data is not an obligatory field, but if the user provides this info, it must be a four digit number, Ex.: 2020.

The innobservance of any of the rules above will cause an `ActiveRecord::RecordInvalid` error and the registration/editing action will fail.

### Gems used
* [rspec](https://rubygems.org/gems/rspec)
* [rspec-rails](https://rubygems.org/gems/rspec-rails)
* [shoulda-matchers](https://rubygems.org/gems/shoulda-matchers)
* [faker](https://rubygems.org/gems/faker)
* [factory_bot_rails](https://rubygems.org/gems/factory_bot_rails)
_______________________________________________________________
### What i learned with this project
* How to implement a service layer in a Rails app to increase code security and organization;
* How to use RSpec and Shoulda-matchers gems to build custom tests;
* How to generate random data using Faker and Factory-bot-rails gems;
* How to make use of partials in different pages throughout the application.
