class StoreItem
    attr_reader :name,:rate,:hasOffer,:minQuantity,:offerPrice

    def initialize (name, rate, hasOffer, minQuantity = 0, offerPrice = 0)
        @name = name
        @rate = rate
        @hasOffer = hasOffer
        @minQuantity = minQuantity
        @offerPrice = offerPrice
    end

    def calculate_cost(quanity)
        if @hasOffer
            cost_with_offer = (quanity / @minQuantity) * @offerPrice
            cost_without_offer = (quanity % @minQuantity) * @rate
            return cost_with_offer + cost_without_offer
        end
        quanity * @rate
    end

    def calculate_savings(quanity)
        if @hasOffer
            total_cost = quanity * @rate
            cost_with_offer = (quanity / @minQuantity) * @offerPrice
            cost_without_offer = (quanity % @minQuantity) * @rate
            return total_cost - (cost_with_offer + cost_without_offer)
        end
        0
    end
end