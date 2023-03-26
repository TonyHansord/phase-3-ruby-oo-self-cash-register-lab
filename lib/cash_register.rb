class CashRegister 

    attr_reader :discount
    attr_accessor :total, :items, :last_item

    def initialize(discount = nil)
        @discount = discount unless discount.nil?
        @total = 0
        @items = []
        @last_item = {}
    end

    def add_item(title, price, quantity = nil)

        if quantity.nil?
            self.total += price
            self.items << title
            self.last_item = {
                title: title,
                price: price,
                quantity: 1
            }
        else 
            self.total += price * quantity
            quantity.times do
                self.items << title
            end
            self.last_item = {
                title: title,
                price: price,
                quantity: quantity
            }
    end
    end

    def apply_discount
        return "There is no discount to apply." if discount.nil?
        discounted = ((100 - self.discount).to_f)/ 100
        self.total = discount.nil? ? self.total : (self.total * discounted).to_i
        return "After the discount, the total comes to $#{self.total}."
    end

    def void_last_transaction
        self.total -= self.last_item[:price] * self.last_item[:quantity]
    end
end
