require 'bundler'
Bundler.require
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/database.sqlite'
)
require_all 'app'
