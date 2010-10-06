require "#{File.expand_path(File.dirname(__FILE__))}/routes"
require 'vegas'

Vegas::Runner.new(MyApp, 'routes')