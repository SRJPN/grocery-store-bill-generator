class Bill
    def initialize purchased_items
        @items = purchased_items
    end

    def total_cost
        @items.reduce(0) { |sum, item| sum + item.price }.ceil(2)
    end

    def savings
        @items.reduce(0) { |sum, item| sum + item.savings }.ceil(2)
    end

    def get_list
        @items.map { |item| [item.name, item.quantity, item.price] }
    end
end