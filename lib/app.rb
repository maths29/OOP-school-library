require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'capitalize'
require_relative 'trimcase'
require_relative 'rental'
require 'json'
class App
  def initialize
    load_books
    load_persons
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

  def list_books
    if @books.empty?
      puts 'No Books Recorded'
    else
      @books.each_with_index { |book, index| puts "#{index} Title : #{book.title}, Author : #{book.author}" }
    end
  end

  def load_books
    @books = []
    return unless File.file?('./lib/books.json') && !File.empty?('./lib/books.json')

    book_data = JSON.parse(File.read('./lib/books.json'))
    book_data.each do |book_info|
      @books << Book.new(book_info['title'], book_info['author'])
    end
  end

  def load_persons
    @person = []
    return unless File.file?('./lib/persons.json') && !File.empty?('./lib/persons.json')

    person_data = JSON.parse(File.read('./lib/persons.json'))
    person_data.each do |person_info|
      @person << Person.new(person_info['age'], person_info['name'], person_info['user_type'])
    end
  end

  def list_person
    load_persons
    if @person.empty?
      puts 'No new persons recorded'
    else
      @person.each_with_index do |person, index|
        puts "#{index} [#{person.user_type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    user_type = gets.chomp.strip.to_i
    print 'Age: '
    age = gets.chomp.strip.to_i
    print 'Name: '
    name = gets.chomp.strip
    create_person_save(user_type, age, name)
  end

  def create_person_save(user_type, age, name)
    existing_persons = File.file?('./lib/persons.json') ? JSON.parse(File.read('./lib/persons.json')) : []
    if user_type == 1
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.strip.upcase == 'Y'
      person = Student.new(name, age, user_type, parent_permission)
    else
      print 'Specialization: '
      specialization = gets.chomp.strip
      person = Teacher.new(name, age, user_type, specialization)
    end
    person_data = { id: person.id, name: person.name, age: person.age }
    if user_type == 1
      person_data[:permission] = person.parent_permission
    else
      person_data[:specialization] = person.specialization
    end
    person_data[:user_type] = person.class.to_s
    existing_persons << person_data
    File.write('./lib/persons.json', JSON.pretty_generate(existing_persons))
    puts 'Person created successfully'
  end

  def add_book
    print 'Title: '
    title = gets.chomp.strip
    print 'Author: '
    author = gets.chomp.strip
    new_book = Book.new(title, author)
    @books << new_book
    existing_books = []
    existing_books = JSON.parse(File.read('./lib/books.json')) if File.file?('./lib/books.json')
    existing_books << { title: new_book.title, author: new_book.author }
    # Write the combined data back to the file
    File.write('./lib/books.json', JSON.pretty_generate(existing_books))
    puts 'Book created successfully'
  end

  def person_index_val
    puts 'Select person from the following list by number'
    @person.each_with_index do |persons, index|
      puts "#{index})[#{persons.user_type}] Name: #{persons.name}, ID: #{persons.id}, Age: #{persons.age}"
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
    rental = Rental.new(date, @person[person_index], @books[book_index])
    # Read existing data from the file if it exists
    existing_rentals = []
    existing_rentals = JSON.parse(File.read('./lib/rentals.json')) if File.file?('./lib/rentals.json')
    # Append the new rental data to the existing data
    existing_rentals << { date: rental.date, person_id: rental.person.id, book_title: rental.book.title,
                          book_author: rental.book.author }
    # Write the combined data back to the file
    File.write('./lib/rentals.json', JSON.pretty_generate(existing_rentals))
    puts 'Rental created successfully'
  end

  def get_rentals_by_person_id(person_id)
    rentals = []
    if File.file?('./lib/rentals.json') && !File.empty?('./lib/rentals.json')
      rental_data = JSON.parse(File.read('./lib/rentals.json'))
      rentals = rental_data.select { |rental| rental['person_id'] == person_id }
    end
    rentals
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    rentals_for_person = get_rentals_by_person_id(id)
    if rentals_for_person.empty?
      puts 'No rentals found for the specified person ID.'
    else
      puts "Rentals for Person ID #{id}:"
      rentals_for_person.each do |rental|
        puts "Date: #{rental['date']}, Book: #{rental['book_title']} by #{rental['book_author']}"
      end
    end
  end
end
