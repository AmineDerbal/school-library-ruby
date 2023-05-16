require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

class App
  attr_accessor :persons, :books, :rentals

  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  def print_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_books
    @books.length.positive? ? print_books : (puts 'No books available')
  end

  def print_persons
    @persons.each do |person|
      puts "[#{person.type}] Name: #{person.name}, Age: #{person.age}"
    end
  end

  def list_people
    @persons.length.positive? ? print_persons : (puts 'No people available')
  end

  def add_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Classroom: '
    classroom = gets.chomp
    print 'Has parent permission? (Y/N): '
    parent_permission = gets.chomp.downcase
    while parent_permission != 'y' && parent_permission != 'n'
      print 'Please input Y or N: '
      parent_permission = gets.chomp.downcase
    end

    student = Student.new(age,name,classroom) if parent_permission == 'y'
    student = Student.new(age,name,classroom, parent_permission: false) if parent_permission == 'n'
    @persons << student
  end

  def add_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    person = Teacher.new(age, specialization, name)
    @persons << person
  end

  def add_book
    puts 'What is the title of the book?'
    title = gets.chomp
    puts 'Who is the author of the book?'
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
  end
end
