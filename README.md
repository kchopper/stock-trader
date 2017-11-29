# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

# Ruby version
  * 2.4.1
# Rails version

# Important Links
  * https://github.com/plataformatec/devise#getting-started
  * https://github.com/plataformatec/devise#configuring-views


# Deployment instructions
* App is deployed on heroku
  
# Gems to install
  * gem 'devise'
  * gem 'twitter-bootstrap-rails'
  * gem 'jquery-rails'
  * gem 'devise-bootstrap-views'

# Commands to remember
  * rails g devise:install
  * rails g devise User
  * rails g bootstrap:install static
  * rails g bootstrap:layout application
  * rails g devise:views:locale en
  * rails g devise:views:bootstrap_templates
  
# List of problems faced during the we tackled them
  *couldn't find file 'device_bootstrap_views' with type 'text/css'
    ** removing *=require devise_bootstrap_views from application .css and adding @import "bootstrap-sprockets";
     * @import "bootstrap"; solved the issue
to the end of application.css.scss file solved the problem
# stock-trader
