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

    def add_room(room)
        @rooms.push room
    end

    def above_market_average?
        if price > 500000
            return true
        else
            false
        end
    end

    def rooms_from_category(category)
        @rooms.find_all do |room|
            room.category == category
        end
    end

    def area
        @rooms.sum do |room|
            room.area
        end
    end

    def details
        {"price" => price, "address" => address}
    end
end
