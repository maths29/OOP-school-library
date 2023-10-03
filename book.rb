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






<<<<<

class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end
end



class Rental
  attr_reader :book, :person, :date

  def initialize(book, person, date)
    @book = book
    @person = person
    @date = date
  end
end





# Creating a book
book = Book.new("Title", "Author")

# Creating a rental record
date = Date.new(2023, 10, 2) # Assuming a Date class
person = Person.new("John Doe") # Assuming a Person class
rental = Rental.new(book, person, date)

# Accessing book rentals
book_rentals = book.rentals



