ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'

Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/database.sqlite3'
)

if ENV['SINATRA_ENV'] == "development"
  require_relative '../secrets.rb'
end

require_relative '../constants'


require_all 'app'
