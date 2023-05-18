require './lib/room'
require './lib/house'

RSpec.describe House do
    house = House.new("$400000", "123 sugar lane")

    it 'exists' do
        expect(house).to be_a House
    end

    it 'should have a price as an integer' do
        expect(house.price).to eq(400000)
    end

    it 'should have an address' do
        expect(house.address).to eq("123 sugar lane")
    end

    it 'has rooms' do
        expect(house.rooms).to eq([])
    end

    it 'can add new rooms' do
        room_1 = Room.new(:bedroom, 10, '13')
        room_2 = Room.new(:bedroom, 11, '15')

        house.add_room(room_1)
        house.add_room(room_2)

        expect(house.rooms.length).to eq(2)
    end

    it 'is above market average?' do
        expect(house.above_market_average?).to eq(false)
    end

    it 'keeps track of rooms based on category' do
        room_1 = Room.new(:bedroom, 10, '13')
        room_2 = Room.new(:bedroom, 11, '15')
        room_3 = Room.new(:living_room, 25, '15')
        room_4 = Room.new(:basement, 30, '41')

        house.add_room(room_1)
        house.add_room(room_2)
        house.add_room(room_3)
        house.add_room(room_4)

        expect(house.rooms_from_category).to eq(2)
        expect(house.rooms_from_category).to eq(1)
    end

end