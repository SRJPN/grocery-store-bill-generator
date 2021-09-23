require_relative 'models/purchased_item'
require_relative 'Models/grocery_store'
require_relative 'bill_printer'

def parse_input input
    input.inject({}) do |list, item|
        if list.has_key? item
            list[item] = list[item] + 1
        else
            list[item] = 1
        end
        list
    end
end

puts "Please enter all the items purchased separated by a comma"
# input = gets.chomp.split(',').map { |x| x.strip}
# milk,milk,bread,banana,bread,bread,bread,milk,apple
input = %w(milk milk bread banana bread bread bread milk apple)

list = parse_input (input)

store = GroceryStore.new
bill = store.generate_bill list
billPrinter = BillPrinter.new
billPrinter.print bill
