require './person'

class Teacher < Person
  def initialize(age:, specialization:, name: 'Unknown', parent_permission: true)
    super(age: age, name: name)
    @specialization = specialization
  end

  attr_reader :specialization

  def can_use_services?
    true
  end
end
