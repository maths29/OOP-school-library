# Add class rental
class Rental
  def initialize(date, person, book)
    @date = date
    @book = book
    @person = person
    # Modify the constructor of Rental to set Book and Person
    book.rentals << self
    person.rentals << self
  end

  attr_accessor :date
  attr_reader :book, :person
end
