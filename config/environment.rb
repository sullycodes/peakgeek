require 'bundler'
require "sinatra/activerecord"

Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/database.sqlite3'
)

require_all 'app'
