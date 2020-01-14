# Challenge

https://github.com/wvchallenges/se-challenge-payroll

# Instructions

* Clone the https://github.com/pf90/se-challenge-payroll and run `bundle install`.

* Setup the database with `bundle exec rake db:migrate`.

* Start the server with `rails s`.

* On the root page click `Upload new Time Report` button. Select your file and click `import`.

* Once sucessfully imported, this will bring you to the show page with the specific detail for that report. 

* If multiple reports are imported the cumulative data will be displayed at the index / root page. 

# A paragraph or two about what you are particularly proud of in your implementation, and why.

I believe this is a simple yet well structured solution to the challenge presented given the time frame and purpose of the exercise. With seperate models for Reports, TimeSheets & Employees, I believe it establishes a solid foundation which could support development going forward. 

The Report model is responsible for importing the report detail & individual time sheet data, while the Employee model is responsible for returning the cumulative pay per employee per pay period. 

While I am quite satisfied with the solution, I do acknowledge its shortcomings in terms of 

* Testing 

* Design & UI

* Hard coding Job rates & ability to support further companies on the same platform

* Improved features in terms of sorting data within payroll reports. 

These among others are items I would rectify going forward. 
