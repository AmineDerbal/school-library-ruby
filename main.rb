require_relative 'app'
require_relative './modules/handle_data'

def main
  app = App.new
  puts 'Welcome to the School Library App!'
  app.run
end

main
