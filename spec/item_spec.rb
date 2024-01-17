require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do
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
    
    describe '#initialize(item)' do
        it "has attributes" do
            expect(@item1.name).to eq("Chalkware Piggy Bank")
            expect(@item2.name).to eq("Bamboo Picture Frame")
        end
    end

    describe '#add_item' do
        before(:each) do
            @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
            @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
        end

        it "can add to bids to items hash" do
            expect(@item1.bids).to eq({})
            
            @item1.add_bid(@attendee2, 20)
            @item1.add_bid(@attendee1, 22)
            
            expect(@item1.bids).to eq({@attendee2 => 20, @attendee1 => 22})
        end
        
        it "can identify highest bid" do
            @item1.add_bid(@attendee2, 20)
            @item1.add_bid(@attendee1, 22)

            expect(@item1.current_high_bid).to eq(22)
        end
    end
end
