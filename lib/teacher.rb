require_relative 'person'
class Teacher < Person
  def initialize(name, age, user_type, specialization)
    super(age, name, user_type)
    @specialization = specialization
  end
  attr_reader :specialization
  def can_use_services?
    true
  end
end
