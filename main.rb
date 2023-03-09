require './app'

def display_options
  puts "\nPlease choose an option:"
  puts [
    '',
    ' [1] - List all books',
    ' [2] - List all people',
    ' [3] - Create a person',
    ' [4] - Create a book',
    ' [5] - Create a rental',
    ' [6] - List all rentals for a person',
    ' [7] - Exit',
    ''
  ]
end

def handle_list_books(app)
  app.list_books
end

def handle_list_people(app)
  app.list_people
end

def handle_create_person(app)
  app.create_person
end

def handle_create_book(app)
  app.create_book
end

def handle_create_rental(app)
  app.create_rental
end

def handle_list_rentals_for_person(app)
  app.list_rentals_for_person
end

def handle_exit
  puts 'Goodbye!'
  exit
end

def handle_invalid_option
  puts 'Invalid option!'
end

def handle_option(app, option)
  case option
  when 1 then handle_list_books(app)
  when 2 then handle_list_people(app)
  when 3 then handle_create_person(app)
  when 4 then handle_create_book(app)
  when 5 then handle_create_rental(app)
  when 6 then handle_list_rentals_for_person(app)
  when 7 then handle_exit
  else handle_invalid_option
  end
end

def main
  app = App.new
  puts "\nWelcome to the School Library App!"

  loop do
    display_options
    print 'Answer: '
    choice = gets.chomp.to_i

    handle_option(app, choice)
  end
end

main
