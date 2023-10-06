require_relative 'spec_helper'
require 'date'

describe Rental do
  let(:book) { Book.new('The Great Gatsby', 'kinu') }
  let(:person) { Person.new(18, 'John Doe', 'student') }

  describe '#initialize' do
    it 'creates a Rental instance with a date' do
      rental = Rental.new('2023-10-06', person, book)
      expect(rental).to be_an_instance_of(Rental)
      expect(rental.date).to eq('2023-10-06')
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end
  end

  describe 'attribute accessors' do
    it 'allows reading and writing the date' do
      rental = Rental.new('2023-10-07', person, book)
      rental.date = '2023-10-08'
      expect(rental.date).to eq('2023-10-08')
    end

    it 'allows reading and writing the book and person' do
      rental = Rental.new('2023-10-09', person, book)
      rental.book = Book.new('New Book', 'pete')
      rental.person = Person.new('student', 'Jane Smith', 78)
      expect(rental.book.title).to eq('New Book')
      expect(rental.person.name).to eq('Jane Smith')
    end
  end
end
