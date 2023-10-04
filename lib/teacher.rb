require_relative 'person'

class Teacher < Person
  def initialize(name, age, specialization, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  attr_reader :specialization

  def can_use_services?
    true
  end
end
