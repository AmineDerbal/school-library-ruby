require_relative 'person'

class Student < Person
  attr_reader :classroom, :type

  def initialize(age,name, classroom, parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
    @type = 'Student'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
