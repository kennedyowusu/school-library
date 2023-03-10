require './base_decorator'
require './capitalize'
require './trimmer'
require './rental'

class Person < Nameable
  attr_reader :rentals, :id
  attr_accessor :name, :age, :parent_permission

  def initialize(age, name, _parent_permission)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @rentals = []
  end

  def add_rentals(book, date)
    new_rental = Rental.new(date, self, book)
    @rentals.push(new_rental)
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || parent_permission?
  end

  def correct_name
    @name
  end
  private :of_age?
end
