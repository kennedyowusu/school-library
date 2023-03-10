class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    raise ArgumentError, 'Book cannot be nil' if book.nil?
    raise ArgumentError, 'Person cannot be nil' if person.nil?

    @date = date
    @book = book
    @person = person

    book.add_rentals(self)
    person.add_rentals(self)
  end
end
