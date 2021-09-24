class BillPrinter
    def initialize
        @header = ['item', 'quantity', 'price']
    end
    
    def print bill
        printable = format_printable bill

        printable.each { |x| puts x }
    end
    
    private

    def format_printable bill
        printable = []

        print_new_line printable, bill
        print_new_line printable, bill
        print_headers printable, bill
        print_line printable, bill
        print_bill_items printable, bill
        print_new_line printable, bill
        print_new_line printable, bill
        print_total printable, bill
        print_savings printable, bill
        
        printable
    end

    def print_headers printable, bill
        printable.push @header.collect { |x| x.capitalize }.join("\t")
        printable
    end

    def print_bill_items printable, bill
        printable.concat bill.get_list.collect { |x| x.join("\t") }
    end

    def print_line printable, bill
        printable.push Array.new(30).map { |x| "-" }.join('')
        printable
    end

    def print_total printable, bill
        printable.push 'Total price : $' + bill.total_cost.to_s
        printable
    end

    def print_savings printable, bill
        printable.push 'You saved $' + bill.savings.to_s + ' today.'
        printable
    end

    def print_new_line printable, bill
        printable.push "\n"
        printable
    end
end