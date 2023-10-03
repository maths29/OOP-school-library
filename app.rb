require_relative 'classroom'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'capitalize'
require_relative 'trimcase'
require_relative 'rental'

class App
  def initialize
    @books = []
    @person = []
    @rentals = []
  end

  def case_method(user_input)
    case user_input
    when 1
      list_books
    when 2
      list_person
    when 3
      create_person
    when 4
      add_book
    when 5
      create_rental
    when 6
      list_rentals
    end
  end

  def start
    user_input = 0
    while user_input != 7
      puts 'Please choose an option by entering a number:'
      puts '1 - List all books'
      puts '2 - List all person'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'
      user_input = gets.chomp.strip.to_i
      case_method(user_input)
    end
  end

  def list_books
    @books.each_with_index do |book, index|
      puts "#{index} Title : #{book.title}, Author : #{book.author}"
    end
  end

  def list_person
    @person.each_with_index do |person, index|
      puts "#{index} [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    user_type = gets.chomp.strip.to_i
    print 'Age: '
    age = gets.chomp.strip.to_i
    print 'Name: '
    name = gets.chomp.strip
    if user_type == 1
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.strip.upcase == 'Y'
      @person << Students.new(name, age, parent_permission)
    else
      print 'Specialization: '
      specialization = gets.chomp.strip
      @person << Teacher.new(name, age, specialization)
    end
    puts 'Person created successfully'
  end

  def add_book
    print 'Title: '
    title = gets.chomp.strip
    print 'Author: '
    author = gets.chomp.strip
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def person_index_val
    puts 'Select person from the following list by number'
    @person.each_with_index do |persons, index|
      person_type = persons.instance_of?(Students) ? 'Student' : 'Teacher'
      puts "#{index})[#{person_type}] Name: #{persons.name}, ID: #{persons.id}, Age: #{persons.age}"
    end

    gets.chomp.to_i
  end

  def accept_book_index
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end

    book_index = gets.chomp.to_i

    until book_index >= 0 && book_index < @books.length
      puts 'Please enter a valid index:'
      book_index = gets.chomp.to_i
    end

    book_index
  end

  def create_rental
    book_index = accept_book_index
    person_index = person_index_val

    print 'Date: '
    date = gets.chomp
    Rental.new(date, @person[person_index], @books[book_index])
    puts 'Rental created successfully'
  end

  def get_rental_id(person_id)
    person = @person.find { |borrowedb| borrowedb.id == person_id }
    person ? person.rentals : []
  end

  def list_rentals
    print 'ID of person : '
    id = gets.chomp.to_i
    choose_person = get_rental_id(id)
    puts 'Rentals: '

    choose_person.each do |rental|
      puts "Date: \"#{rental.date}\", Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end
