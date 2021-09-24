class GroceryStore
    def initialize
        milk = StoreItem.new('Milk', 3.97, true, 2, 5.00)
        bread = StoreItem.new('Bread', 2.17, true, 3, 6.00)
        banana = StoreItem.new('Banana', 0.99, false)
        apple = StoreItem.new('Apple', 0.89, false)

        @pricing_table = {
            'milk' => milk,
            'bread' => bread,
            'banana' => banana,
            'apple' => apple
        }
    end

    def generate_bill purchase_list
        items = []

        purchase_list.each do |key, value|
            price = @pricing_table[key.downcase].calculate_cost (value)
            savings = @pricing_table[key.downcase].calculate_savings (value)
            item = PurchasedItem.new key, price, value, savings 
            items.push item
        end
        Bill.new items
    end
end