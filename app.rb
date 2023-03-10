require './student'
require './teacher'
require './book'
require './rental'

class App
  attr_reader :books, :persons, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  # list methods
  def list_people
    if persons.empty?
      puts "\nThere are no people \n"
    else
      persons.each_with_index do |person, index|
        puts "\n [#{index}] [#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def list_books
    if books.empty?
      puts "\nThere are no books"
    else
      books.each_with_index do |book, index|
        puts "\n [#{index}] [#{book}] Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_rentals
    list_people
    print 'Enter the person\'s ID : '
    person_id = gets.chomp.to_i
    puts 'Rentals: '
    rental_list_by_id(person_id)
  end

  def rental_list_by_id(person_id)
    rentals.each do |rental|
      if rental.person.id == person_id
        puts "\nDate: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end

  # create methods
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    number = gets.chomp.to_i
    case number
    when 1
      create_student
    when 2
      create_teacher
    else
      puts '\nSelect a valid option \n'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.capitalize
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.downcase == 'y'
    print 'Classroom: '
    classroom = gets.chomp
    add_student(age, classroom, name, permission)
    print_message("\nStudent created successfully. \n")
  end

  def add_student(age, classroom, name, permission)
    new_student = Student.new(age, classroom, name, permission)
    persons << new_student
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.capitalize
    print 'Specialization: '
    specialization = gets.chomp
    add_teacher(age, specialization, name)
    print_message("\nTeacher created successfully. \n")
  end

  def add_teacher(age, specialization, name)
    new_teacher = Teacher.new(age, specialization, name)
    persons << new_teacher
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    add_book(title, author)
    print_message("\nBook created successfully. \n")
  end

  def add_book(title, author)
    new_book = Book.new(title, author)
    books << new_book
  end

  def create_rental
    list_people
    print 'Choose a person: '
    person_id = gets.chomp.to_i
    list_books
    print 'Choose a book: '
    book_id = gets.chomp.to_i
    print 'Rental date [yyyy-mm-dd]: '
    rental_date = gets.chomp
    add_rental(person_id, book_id, rental_date)
    print_message("\nRental created successfully. \n")
  end

  def add_rental(person_id, book_id, rental_date)
    person = persons[person_id]
    book = books[book_id]
    new_rental = Rental.new(person, book, rental_date)
    rentals << new_rental
  end

  def list_rentals_for_person
    list_people
    print 'Choose a person: '
    person_id = gets.chomp.to_i
    puts "\nRentals for #{persons[person_id].name}:"
    rental_list_by_id(person_id)
  end

  def print_message(message)
    puts message
  end
end
