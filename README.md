# RUBY ON RAILS ASSIGNMENT

This assignment is for
  `ProMobi Technologies Pvt. Ltd.`

  <sub>Please find below the Assignment details: and what is expected from the assignment.</sub>
  
  <sub>We would like you to complete the assignment in 2-3 days, but in the case, due to current work commitments you feel 3-4 days are less, you can give us the estimates, to when you can submit the solution.</sub>

  __Problem Statement:__
    
  <sub>Given 2 models</sub> `Course and Tutor`

    - A course can have many tutors.
    - Tutor can teach one course only.

  __Write:__

    1. Common POST API to create a course & its tutors
    2. GET API to list all the courses along with their tutors - Add Rspecs / Write complete test cases for API's

__System configuration and dependencies__
* Ruby version
> Ruby 3.2.2 [ arm64 ]

> Rails 7.0.4.3

* System dependencies
> psql (PostgreSQL) 14.8 (Homebrew)
* Database creation
> rails db:create
* Database initialization
> rails db:migrate
* How to run the test suite
> rspec
* Services<sub>(Use postman to test below APIs)</sub>
  - GET localhost:3000/courses
  - POST localhost:3000/courses
      ```
        {
          "name": "DS3",
          "tutors": [
            {
              "name": "Shubham3"
            }
          ]
        }
      ```