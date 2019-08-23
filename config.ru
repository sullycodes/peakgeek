require_relative './config/environment'

use Rack::MethodOverride
use PeaksController
use SessionsController
run ApplicationController