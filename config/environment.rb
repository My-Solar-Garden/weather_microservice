ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
#
# ActiveRecord::Base.establish_connection(
#   :adapter => "pg",
#   :database => "db/#{ENV['SINATRA_ENV']}.pg"
# )

require './app/controllers/application_controller'
require_all 'app'
