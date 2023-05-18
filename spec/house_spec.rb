require './lib/room'
require './lib/house'
require 'pry'

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

        expect(house.rooms).to eq([room_1, room_2])
        expect(house.rooms.length).to eq(2)
    end

    it 'is above market average?' do
        expect(house.above_market_average?).to eq(false)
    end

    it 'keeps track of rooms based on category' do
        house = House.new("$400000", "123 sugar lane")
        room_1 = Room.new(:bedroom, 10, '13')
        room_2 = Room.new(:bedroom, 11, '15')
        room_3 = Room.new(:living_room, 25, '15')
        room_4 = Room.new(:basement, 30, '41')

        house.add_room(room_1)
        house.add_room(room_2)
        house.add_room(room_3)
        house.add_room(room_4)

        expect(house.rooms_from_category(:bedroom)).to eq([room_1, room_2])
        expect(house.rooms_from_category(:basement)).to eq([room_4])
    end

    it 'takes the area of the house' do
        house = House.new("$400000", "123 sugar lane")
        room_1 = Room.new(:bedroom, 10, '13')
        room_2 = Room.new(:bedroom, 11, '15')
        room_3 = Room.new(:living_room, 25, '15')
        room_4 = Room.new(:basement, 30, '41')

        house.add_room(room_1)
        house.add_room(room_2)
        house.add_room(room_3)
        house.add_room(room_4)
        
        expect(house.area).to eq(1900)
    end

    it 'can show details in a hash' do
        house = House.new("$400000", "123 sugar lane")

        expected_hash = {"price" => 400000, "address" => "123 sugar lane"}
        expect(house.details).to eq(expected_hash)
    end
end