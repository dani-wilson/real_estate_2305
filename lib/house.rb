require 'pry'

class House
    attr_reader :price, :address, :rooms

    def initialize(price, address)
        @price = price
        @address = address
        @rooms = []
    end

    def price
        @price.delete! "$"
        @price.to_i
    end


end
