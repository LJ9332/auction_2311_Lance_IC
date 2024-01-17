require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Auction do
    before(:each) do
        @item1 = Item.new('Chalkware Piggy Bank')
        @item2 = Item.new('Bamboo Picture Frame')
        @attendee = Attendee.new({name: 'Megan', budget: '$50'})
        @auction = Auction.new

        expect(@item1 = Item.new('Chalkware Piggy Bank')).to be_a(Item)
        expect(@item2 = Item.new('Bamboo Picture Frame')).to be_a(Item)
        expect(@attendee = Attendee.new({name: 'Megan', budget: '$50'})).to be_a(Attendee)
        expect(@auction = Auction.new).to be_a(Auction)
    end

    describe '#initialize' do
        it "has attributes" do
            expect(@auction.items).to eq([])
        end
    end
end