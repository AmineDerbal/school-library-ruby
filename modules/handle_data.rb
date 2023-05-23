require 'json'
require 'fileutils'
require_relative '../teacher'
require_relative '../student'
require_relative "../book"

module HandleData
  def check_data_files
     FileUtils.mkdir_p('./data')
    File.open('./data/persons.json', 'w') unless File.exist?('./data/persons.json')
    File.open('./data/books.json', 'w') unless File.exist?('./data/books.json')
    File.open('./data/rentals.json', 'w') unless File.exist?('./data/rentals.json')
  end

  def save_books
    books_data = @books.map { |book| { 'title' => book.title, 'author' => book.author, 'rentals' => book.rentals} }
    File.open('./data/books.json', 'w') do |file|
      file.write(JSON.pretty_generate(books_data))
    end
  end
  
  def load_books
    books = []
    json_data = File.read('./data/books.json')
    unless json_data.empty?
      JSON.parse(json_data).map do |book| 
        data = Book.new(book['title'], book['author'])
        data.rentals = book['rentals']
        books << data
      end
    end
    books
  end


  def load_student(person)
    student = if person['parent_permission']
                Student.new(person['age'], person['name'], person['classroom'])
              else
                Student.new(person['age'], person['name'], person['classroom'], person['parent_permission'])
              end
    student.type = person['type']
    student.id = person['id']
    student.rentals = person['rentals']
    student
  end

  def load_teacher(person)
    teacher = Teacher.new(person['age'], person['specialization'], person['name'])
    teacher.type = person['type']
    teacher.id = person['id']
    teacher.rentals = person['rentals']
    teacher
  end

  def load_persons
    persons = []
    json_data = File.read('./data/persons.json')
    unless json_data.empty?
      JSON.parse(json_data).map do |person|
        persons << if person['type'] == 'Teacher'
                     load_teacher(person)
                   else
                     load_student(person)
                   end
      end
    end
    persons
  end

  def save_persons
    data = []
    @persons.each do |person|
      person_data = {
        id: person.id,
        name: person.name,
        age: person.age,
        parent_permission: person.parent_permission,
        rentals: person.rentals,
        type: person.type
      }
      if person.type == 'Teacher'
        person_data[:specialization] = person.specialization
      else
        person_data[:classroom] = person.classroom
      end
      data << person_data
    end
    return if data.empty?

    File.write('./data/persons.json', JSON.pretty_generate(data))
  end
end
