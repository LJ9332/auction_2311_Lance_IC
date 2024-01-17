class Item
    attr_reader :name, :bids

    def initialize(name)
        @name = name
        @bids = {}
        @bidding_closed = false
    end

    def add_bid(attendee, bid_amount)
        @bids[attendee] = bid_amount
    end

    def current_high_bid
        @bids.values.max
    end

    def close_bidding
        @bidding_closed = true
    end
end