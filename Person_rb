# frozen_string_literal: true

require_relative 'nameable'
require_relative 'capitalize'
require_relative 'trimcase'
# class for library
class Person < Nameable
  # constructor method
  attr_reader :id, :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    @name = name
    @age = age
    @id = Random.rand(1..1000)
    @parent_permission = parent_permission
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

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name