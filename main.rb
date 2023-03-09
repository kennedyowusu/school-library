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

def main
app = App.new
puts "\nWelcome to School Library App!"

loop do
display_options
print 'Answer: '
choice = gets.chomp.to_i

ruby
Copy code
case choice
when 1 then app.list_books
when 2 then app.list_people
when 3 then app.create_person
when 4 then app.create_book
when 5 then app.create_rental
when 6 then app.list_rentals_for_person
when 7
  puts 'Goodbye!'
  break
else
  puts 'Invalid option!'
end
end
end

main