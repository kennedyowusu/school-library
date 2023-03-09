require './person'

class Teacher < Person
  def initialize(age:, specialization:, name: 'Unknown', _parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  attr_reader :specialization

  def can_use_services?
    true
  end
end
