require_relative './modules/list_books'
require_relative './modules/list_people'
require_relative './modules/add_book'
require_relative './modules/add_person'
require_relative './modules/add_rental'
require_relative './modules/list_rentals'

class App
  include ListAllBooks
  include ListAllPeople
  include CreatePerson
  include AddBook
  include AddRental
  include ListAllRentals
  attr_accessor :persons, :books, :rentals

  def initialize
    @persons = []
    @books = []
    @rentals = []
  end
end
