# Didn't know what this was supposed to do, moved the config before each rspec logic to the spec helper file.

# RSpec.configure do |config|

#   config.before(:suite) do
#     DatabaseCleaner.clean_with(:truncation)
#   end

#   config.before(:each) do
#     DatabaseCleaner.strategy = :transaction
#   end

#   config.before(:each, :js => true) do
#     DatabaseCleaner.strategy = :truncation
#   end

#   config.before(:each) do
#     DatabaseCleaner.start
#   end

#   config.after(:each) do
#     DatabaseCleaner.clean
#   end

# end
