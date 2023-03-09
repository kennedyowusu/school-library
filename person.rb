require './trimmer'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', _parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def of_age?
    @age >= 18
  end
end
