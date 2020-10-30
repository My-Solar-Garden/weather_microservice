ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
use Rack::MethodOverride
use Rack::JSONBodyParser
use UsersController
run ApplicationController
