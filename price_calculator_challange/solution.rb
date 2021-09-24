require_relative 'PurchasedItem'

purchase_list = %w(milk milk bread banana bread bread bread milk apple)


milk = PurchasedItem.new('Milk', 3.97, true, 2, 5.00)
bread = PurchasedItem.new('Bread', 2.17, false, 3, 6.00)
banana = PurchasedItem.new('Banana', 0.99, false)
apple = PurchasedItem.new('Apple', 0.89, false)

pricing_table = {
    'milk' => milk,
    'bread' => bread,
    'banana' => banana,
    'apple' => apple
}

bill = {}

purchase_list.each do |item|
    # bill.index {|element| element == 'bar' }
    if bill.has_key? item
        bill[item]['quantity'] = bill[item]['quantity'] + 1
    else
        bill[item] = {'quantity' => 1}
    end
end

bill.each do |key, value| 
    value['price'] = pricing_table[key].calculate_cost value['quantity']
end

puts bill