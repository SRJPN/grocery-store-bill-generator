class BillPrinter
    def initialize
        @header = ['item', 'quantity', 'price']
    end
    def print bill
        print_row @header.collect { |x| x.capitalize }
        print_line
        bill.each { |item| print_row @header.map { |header| item[header].to_s.capitalize } }
    end

    def print_row row
        puts row.join("\t")
    end

    def print_line
        puts Array.new(25).map { |x| "-" }.join('')
    end
end