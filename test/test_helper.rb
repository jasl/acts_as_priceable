require 'minitest/spec'
require 'minitest/autorun'

require 'active_model'
require 'acts_as_priceable'

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
