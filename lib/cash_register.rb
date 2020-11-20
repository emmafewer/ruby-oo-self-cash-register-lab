require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items

    def initialize(discount = false)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.total += price*quantity
        # counter = 0
        # while counter < quantity do
        #     @items << title
        #     counter +=1
        # end
        #quantity.times{@items << title}
        @items << {:title => title, :price => price, :quantity => quantity}
    end

    def apply_discount
        if @discount  
            self.total*=(1-(@discount.to_f/100))
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        result = []
        @items.each do |hash| 
            hash[:quantity].times{result << hash[:title]}  
        end  
        result  
    end

    def void_last_transaction
        if @items.length == 1
            @total = 0.0
        else 
            @total -= @items[@items.length-1][:price]
        end
        @items.pop    
    end
end
