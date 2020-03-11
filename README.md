# Mod3Project-FlatironFinder-Backend

## Overview  

This is the Back End for the Flatiron Finder App that I created for my Module 3 Project at Flatiron School. [Click here for the Front End, which includes user stories and the actual purpose of the app](https://github.com/aaronburmeister/Mod3Project-FlatironFinder-Frontend). It uses PostgreSQL as a database.

## Installation Instructions

In addition to the front end code, you need to install this back end code. Follow the directions below:
1. If you don't already have it installed, install Ruby. [Here's a link for more instructions on that.](https://www.ruby-lang.org/en/documentation/installation/) I used Ruby 2.6.1.

2. Navigate to the directory where you clone this repository, then, in your console, type `bundle install`. This should install all of the Ruby gems I used to make the app. I also used [Rails.](http://installrails.com/)

3. Run `rails db:setup` to create the PostgreSQL database using rails

4. Run `rails db:migrate` to create the tables.

5. Run `rails db:seed` to create the base seeds.

6. The front end expects the backend to be hosted on `http://localhost:3000` - Rails will run on this port by default, so you should only have to type `rails s` to start the server. However, if you have it configured to use a different port by default, you can run `rails s -p 3000` to make it run on port 3000.

7. Open the index.html from the Frontend to start using the app.
