require_relative 'nameable'

class Decorator < Nameable
  attr_reader :nameable

  def initialize(nameable)
    @nameable = nameable
    super()
  end

  def correct_name
    @nameable.correct_name
  end
end
