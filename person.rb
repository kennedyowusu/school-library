require './nameable'
require './base_decorator'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  attr_reader :id, :name, :age, :parent_permission

  def initialize(age:, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private :of_age?
end

person = Person.new(age: 22, name: 'maximilianus')
p person.correct_name
person_with_capitalized_name = CapitalizeDecorator.new(person)
p person_with_capitalized_name.correct_name
person_with_capitalized_trimmed_name = TrimmerDecorator.new(person_with_capitalized_name)
p person_with_capitalized_trimmed_name.correct_name
