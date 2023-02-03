# Instatalk

Ruby on Rails application for instant messaging in public rooms using Hotwire.

Create a room and communicate with people.

### Run

For the application to work, you will need the `Ruby` and `Node` languages installed. It is also necessary to have `Redis` and `PostgreSQL` databases.

The application is built on Ruby on `Rails 7.0.4` and `Ruby 3.1.2`.

Before runing the application, run the commands from the project folder:

```
$ bundle
$ rails db:create
$ rails db:migrate
$ yarn build
$ yarn build:css
```

And run the app:

```
$ rails s
```

The application will be available at `http://localhost:3000/`.

### Database in production
In the `production` environment, you must specify the database login and password in the environment variables `DATABASE_USERNAME` and `DATABASE_PASSWORD` or specify explicitly in `config/database.yml`:

```
production:
  <<: *default
  database: instatalk_production
  username: #Your database username
  password: #Your database password
```
