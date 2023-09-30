require './app'

app = App.new

def lib_books(app)
  puts 'You have not added any books yet.' if app.books.empty?

  app.books.each do |book|
    puts "Title: \"#{book.title}\", Author: #{book.author}"
  end
end

def lib_persons(app)
  puts 'There are no Students/Teachers' if app.persons.empty?

  app.persons.each do |person|
    type = 'Person'
    if person.instance_of?(Students)
      type = 'Student'
    elsif person.instance_of?(Teacher)
      type = 'Teacher'
    end
    puts "#{type} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
end

def created_students(app)
  print 'Age: '
  age = gets.chomp.to_i
  print 'Name: '
  name = gets.chomp
  print 'Has parent permission? [Y/N]: '
  parent_permission = gets.chomp.upcase
  app.create_student(name, age, parent_permission == 'Y')
end

def created_teachers(app)
  print 'Age: '
  age = gets.chomp.to_i
  print 'Name: '
  name = gets.chomp
  print 'Specialization: '
  specialization = gets.chomp
  app.create_teacher(name, age, specialization)
end

def validinput(user, app)
  if user == '1'
    created_students(app)
  elsif user == '2'
    created_teachers(app)
  end
  puts 'Person created successfully'
end

def create_person(app)
  print 'Do you want to create (1) student / (2) teacher? [Input the number]: '
  valid_inputs = %w[1 2]
  user_input = gets.chomp
  until valid_inputs.member? user_input
    puts 'Please enter either 1 or 2:'
    user_input = gets.chomp
  end
  validinput(user_input, app)
end

def created_books(app)
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  app.create_book(title, author)
  puts 'Book created successfully'
end

def accept_book_index(app)
  puts 'Select a book from the following list by number'
  app.books.each_with_index do |book, index|
    puts "#{index}) Title: #{book.title}, Author: #{book.author}"
  end

  book_index = gets.chomp.to_i

  until book_index >= 0 && book_index < app.books.length
    puts 'Please enter a valid index:'
    book_index = gets.chomp.to_i
  end

  book_index
end

def person_index_val(app)
  puts 'Select person from the following list by number'
  app.persons.each_with_index do |person, index|
    person_type = person.instance_of?(Students) ? 'Student' : 'Teacher'
    puts "#{index})[#{person_type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end

  gets.chomp.to_i
end

def created_rental(app)
  book_index = accept_book_index(app)
  person_index = person_index_val(app)

  print 'Date: '
  date = gets.chomp
  app.create_rental(date, book_index, person_index)
  puts 'Rental created successfully'
end

def list_rentals_for_person(app)
  puts 'ID of person:'
  person_id = gets.chomp.to_i
  rentals = app.get_rental_id(person_id)

  puts 'Rentals:'
  rentals.each do |rental|
    puts "Date: \"#{rental.date}\", Book: #{rental.book.title} by #{rental.book.author}"
  end
end

def exit_message(_app)
  puts 'Thank you for using the library app!'
end

ACTIONS = {
  '1' => {
    prompt: 'List all books',
    handler: method(:lib_books)
  },
  '2' => {
    prompt: 'List all people',
    handler: method(:lib_persons)
  },
  '3' => {
    prompt: 'Create a person',
    handler: method(:create_person)
  },
  '4' => {
    prompt: 'Create a book',
    handler: method(:created_books)
  },
  '5' => {
    prompt: 'Create a rental',
    handler: method(:created_rental)
  },
  '6' => {
    prompt: 'List all rentals for a given person id',
    handler: method(:list_rentals_for_person)
  },
  '0' => {
    prompt: 'Exit',
    handler: method(:exit_message)
  }
}.freeze

def main(app)
  puts 'Welcome to the School Library App!'
  loop do
    puts ''
    ACTIONS.each_pair do |action_id, action|
      puts "#{action_id} - #{action[:prompt]}"
    end

    chosen_id = gets.chomp

    ACTIONS[chosen_id][:handler].call(app)
    break if chosen_id == '0'
  end
end

# start the application
main(app)
