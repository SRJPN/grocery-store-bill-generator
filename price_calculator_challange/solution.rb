require_relative 'models/purchased_item'
require_relative 'Models/grocery_store'
require_relative 'bill_printer'

purchase_list = %w(milk milk bread banana bread bread bread milk apple)

list = purchase_list.inject({}) do |bill, item|
    # bill.index {|element| element == 'bar' }
    if bill.has_key? item
        bill[item] = bill[item] + 1
    else
        bill[item] = 1
    end
    bill
end

store = GroceryStore.new
bill = store.generate_bill list
billPrinter = BillPrinter.new
billPrinter.print bill
