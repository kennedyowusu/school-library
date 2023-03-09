require './person'

class Student < Person
  def initialize(age:, classroom:, name: 'Unknown', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  attr_reader :classroom

  def play_hooky
    '¯\(ツ)/¯'
  end

  def to_s
    "Student(id: #{@id}, name: #{@name}, age: #{@age}, classroom: #{@classroom})"
  end
end
