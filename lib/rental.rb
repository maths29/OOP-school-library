require_relative 'book'
# Add class rental
class Rental
  def initialize(date, person, book)
    @date = date
    @book = book
    @person = person
  end

  attr_accessor :date, :book, :person
end
