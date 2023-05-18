require './lib/room'
require './lib/house'

RSpec.describe House do
    house = House.new("$400000", "123 sugar lane")

    it 'exists' do
        expect(house).to be_a House
    end
end