require_relative 'rental'
# Add book for collection
class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # Create the has-many side of Book and Rental
  attr_reader :rentals

  # Modify the constructor of Rental to set Book and Person
  def rentto(date, person)
    Rental.new(date, person, self)
  end

  attr_accessor :title, :author
end
