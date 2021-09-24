class BillPrinter
    def initialize
        @header = ['item', 'quantity', 'price']
    end
    
    def print bill
        print_new_line
        print_new_line
        print_row @header.collect { |x| x.capitalize }
        print_line
        bill.get_list.each { |x|  print_row x }
        print_new_line
        print_new_line
        print_total bill
        print_savings bill
    end
    
    private

    def print_row row
        puts row.join("\t")
    end

    def print_line
        puts Array.new(30).map { |x| "-" }.join('')
    end

    def print_total bill
        puts 'Total price : $' + bill.total_cost.to_s
    end

    def print_savings bill
        puts 'You saved $' + bill.savings.to_s + ' today.'
    end

    def print_new_line
        puts "\n"
    end
end