# Decision engine

## Technologies

* Ruby 3.2.1, Rails 7.0.7, Tailwindcss for styling
* Standard for code style. Run `standardrb` before pushing to repository to avoid offenses.

## Installation

Assuming you're running on a mac or some flavor of Linux:
* Install postgres if you don't have it
* Start postgres if it isn't running
* Install ruby-3.2.1 if you don't already have it
* Use your ruby environment manager of choice (.rvm, .rb_env, etc) to create and then run a ruby environment under ruby-3.2.1
* Install rails (`gem install rails -v  7.0.7`)
* [Local setup](#local-setup)
* Create the db and run the migrations `rails db:create db:migrate`
* Start the server with `bin/dev` and test the app is running OK by going to http://localhost:3000/

## Notes:

* I haven't added specs at all. Should be added RSpec w/ unit, integration and system specs. It's just because of time :)
