# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

# Rails Events
Implementation of an online event booking system.

## Requirements

#### Ruby

This application uses Ruby version `2.5.3`. To install use `rvm` or `rbenv`.

* RVM

        rvm install 2.5.1
        rvm use 2.5.1
    - To set Ruby `2.5.1` as the default Ruby version for your computer, run

            rvm use 2.5.1 --default

* Rbenv

        rbenv install 2.5.1
    - To switch to `2.5.1` temporarily for this project, use

            rbenv local 2.5.1

    - To use this version as the default Ruby version for your global environment, use

            rbenv global 2.5.1

#### Bundler

Bundler provides a consistent environment for Ruby projects by tracking and installing the exact gems and versions that are needed

To install:

        gem install bundler

#### Rails

This applications uses the one of the latest versions of rails. You will need to upgrade if you don't already have it istalled. The rails version being used is `rails 5.2.1`.

To install:

        gem install rails

#### PostgreSQL

This application makes use of the postgres database. For local development, you need to install it.
To install postgres using `brew`:

        brew install postgresql

For extra information on how to configure, make use of this [tutorial](https://www.codementor.io/engineerapart/getting-started-with-postgresql-on-mac-osx-are8jcopb).

To install postgres using a client make use of this application - [Postgres.app](https://postgresapp.com/)

These are just recommendations, feel free to look up more ways of installing and configuring postgresSQL.

## Installation

To get up and running with the project locally, follow the following steps.

* Clone the app

        git clone https://github.com/BasilMawejje/rails-events.git

* Move into the directory and install all the requirements.

    ```bash
    cd rails-events/

    bundle install
    ```

* Setup the database
        rails db:create
        rails db:migrate

* Run the application in the development environment

        foreman start

* To seed the application with data then run(ensure that **redis** and **sidekiq** are up and running);

        rake db:seed

    Now visit [localhost:3000](http://localhost:3000)
