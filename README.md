# AUTHOR BOOKS

This is Rails API which will give you search result match in Authors, Books and Reviews.

### Dependencies
- Ruby 2.5.1
- Rails 5.2.2
- Json Web Token (JWT)
- PostgreSQL
- Bcrypt

### Installation
- Install dependencies

        $ bundle install

- Create database

        $ rake db:create
        
- Run migration

        $ rake db:migrate
        
- Run seed

        $ rake db:seed
    
- Run this project
        
        $ rails server
        
- API to test User create CURL

        $ curl -X POST \
            http://localhost:3000/users \
            -H 'content-type: multipart/form-data;' \
            -F 'name=user one' \
            -F username=userone \
            -F email=userone@gmail.com \
            -F password=123456 \
            -F password_confirmation=123456
            
- API to login as test user

        $ curl -X POST \
            http://localhost:3000/auth/login \
            -H 'content-type: multipart/form-data;' \
            -F email=userone@gmail.com \
            -F password=123456

- API yo search data with user login

        $ curl -X GET \
            'http://localhost:3000/search?q=doctor' \
            -H 'authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NjU5NDkzOTR9.4FhELFA1uJie0UhzOfRbMfnNiqlPjMhHIUIQDh-FMzc' \
