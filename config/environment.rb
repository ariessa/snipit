# Load the Rails application.
require_relative "application"

require 'ipinfo-rails'
config.middleware.use(IPinfoMiddleware, {token: ENV['GMAPS_API_KEY']})

# Initialize the Rails application.
Rails.application.initialize!
