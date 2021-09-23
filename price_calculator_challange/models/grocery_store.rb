class GroceryStore
    def initialize
        milk = PurchasedItem.new('Milk', 3.97, true, 2, 5.00)
        bread = PurchasedItem.new('Bread', 2.17, true, 3, 6.00)
        banana = PurchasedItem.new('Banana', 0.99, false)
        apple = PurchasedItem.new('Apple', 0.89, false)

        @pricing_table = {
            'milk' => milk,
            'bread' => bread,
            'banana' => banana,
            'apple' => apple
        }
    end

    def generate_bill purchase_list
        bill = []

        purchase_list.each do |key, value| 
            bill.push ({
                'item' => key, 
                'price' => (@pricing_table[key.downcase].calculate_cost (value)),
                'savings' => (@pricing_table[key.downcase].calculate_savings (value)),
                'quantity' => value
            })
        end
        bill
    end
end