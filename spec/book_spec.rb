require_relative '../lib/book'
require 'date'

describe Book do
  let(:book) { Book.new("Title", "Author") }
  let(:person) { instance_double("Person", rentals: []) } # Mock Person with a rentals array

  it "initializes with title and author" do
    expect(book.title).to eq("Title")
    expect(book.author).to eq("Author")
  end

  it "creates rentals" do
    date = Date.new(2023, 10, 2)
    person = double("Person")
    rental = book.rentto(date, person)
    
    expect(rental).to be_an_instance_of(Rental)
    expect(rental.book).to eq(book)
  end
end
