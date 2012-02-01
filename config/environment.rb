# Load the rails application
require File.expand_path('../application', __FILE__)

Paperclip.options[:command_path] = "/usr/bin"

# Initialize the rails application
Nwa::Application.initialize!
