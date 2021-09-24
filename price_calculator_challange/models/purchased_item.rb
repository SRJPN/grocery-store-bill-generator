class PurchasedItem
    attr_reader :name, :price, :quantity, :savings
    
    def initialize name, price, quantity, savings
        @name = name
        @price = price
        @quantity = quantity
        @savings = savings
    end
end