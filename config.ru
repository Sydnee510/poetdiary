require_relative './config/environment'

use Rack::MethodOverride
use AuthorsController
use PoemsController
run ApplicationController
