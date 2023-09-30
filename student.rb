class Students < Person
  def initialize(name, age, parent_permission)
    super(age, name)
    @parent_permission = parent_permission
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.addstudent(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
