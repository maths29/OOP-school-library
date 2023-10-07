require_relative 'spec_helper'

describe Person do
  let(:person) { Person.new(25, 'John', 'Student') }

  it 'initializes with age, name, and user_type' do
    expect(person.age).to eq(25)
    expect(person.name).to eq('John')
    expect(person.user_type).to eq('Student')
  end

  it 'creates rentals' do
    date = Date.new(2023, 10, 2)
    book = person
    rental = person.rentbook(date, book)

    expect(rental).to be_an_instance_of(Rental)
    expect(rental.person).to eq(person)
  end
end
