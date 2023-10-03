require_relative 'nameable'
require_relative 'capitalize'
require_relative 'trimcase'
require_relative 'rental'
# class for library
class Person < Nameable
  # constructor method
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    @name = name
    @age = age
    @id = Random.rand(1..1000)
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  # getter methods
  def getid
    @id
  end

  def getname
    @name
  end

  def getage
    @age
  end

  # setter methods
  def setname=(val)
    @name = val
  end

  def setage=(val)
    @age = val
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def rentbook(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end

