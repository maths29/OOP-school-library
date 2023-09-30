require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

# Methods to use with the application
class App
  def initialize
    @books = []
    @persons = []
  end

  attr_reader :persons, :books

  # Method to create a book
  def create_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
  end

  # Method to create a person (teacher or student)
  def create_student(name, age, parent_permission)
    student = Students.new(name, age, parent_permission)
    @persons << student
  end

  def create_teacher(name, age, specialization)
    teacher = Teacher.new(name, age, specialization)
    @persons << teacher
  end

  def create_rental(date, book_index, person_index)
    Rental.new(date, @persons[person_index], @books[book_index])
  end

  def get_rental_id(person_id)
    person = @persons.find { |borrowedb| borrowedb.id == person_id }
    person ? person.rentals : []
  end
end
