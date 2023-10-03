require_relative 'app'

def main
  app = App.new
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
    app.case_method(user_input)
  end
end

main
