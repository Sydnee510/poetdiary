require 'bundler/setup'
Bundler.require


require_relative '../app/models/author.rb'
require_relative '../app/models/poem.rb'
require_relative '../app/controllers/application_controller.rb'
require_relative '../app/controllers/poems_controller.rb'
require_relative '../app/controllers/authors_controller.rb'