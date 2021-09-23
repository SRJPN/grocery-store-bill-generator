class BillPrinter
    def initialize
        @header = ['item', 'quantity', 'price']
    end
    
    def print bill
        print_new_line
        print_new_line
        print_row @header.collect { |x| x.capitalize }
        print_line
        bill.each { |item| print_row @header.map { |header| item[header].to_s.capitalize } }
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
        puts 'Total price : $' + bill.reduce(0) { |sum, item| sum + item['price'] }.to_s
    end

    def print_savings bill
        puts 'You saved $' + bill.reduce(0) { |sum, item| sum + item['savings'] }.ceil(2).to_s + ' today.'
    end

    def print_new_line
        puts "\n"
    end
end