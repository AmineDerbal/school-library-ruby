require_relative 'app'

def display_menu_options
  puts 'Please choose an option by entering a number:'
  puts '1- List all books'
  puts '2- List all people'
  puts '3- Create a person'
  puts '4- Create a book'
  puts '5- Create a rental'
  puts '6- List all rentals for a given person id'
  puts '7- Exit'
end

def add_person(app)
  print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
  person_type = gets.chomp
  while person_type != '1' && person_type != '2'
    print 'Please input 1 or 2: '
    person_type = gets.chomp
  end
  if person_type == '1'
    app.add_student
  else
    app.add_teacher
  end
end

def run_app(app)
  loop do
    display_menu_options
    input = gets.chomp
    case input
    when '1'
      app.list_books
    when '2'
      app.list_people
    when '3'
      add_person(app)
    when '4'
      app.add_book
    when '5'
      app.add_rental
      when '6'
      app.list_rentals
    when '7'
      break
    else
      puts 'Invalid input. Please try again.'
    end
  end
end

def main
  app = App.new
  puts 'Welcome to the School Library App!'
  run_app(app)
end

main
