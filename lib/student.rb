require_relative 'person'
class Student < Person
  def initialize(name, age, user_type, parent_permission)
    super(age, name, user_type)
    @parent_permission = parent_permission
  end
  attr_reader :parent_permission

  def classroom=(classroom)
    @classroom = classroom
    classroom.addstudent(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
