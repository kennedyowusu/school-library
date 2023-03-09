class Person
  MIN_AGE = 18
  def initialize(age:, name: 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  attr_reader :id
  attr_writer :name, :age

  def of_age?
    @age >= MIN_AGE
  end

  def can_use_services?
    of_age? || parent_permission?
  end

  def to_s
    "Person(id: #{@id}, name: #{@name}, age: #{@age})"
  end

  private

  def parent_permission?
    @parent_permission
  end
end
