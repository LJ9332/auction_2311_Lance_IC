class Auction
    attr_reader :items

    def initialize
        @items = []
    end

    def add_item(item)
        @items << item
    end

    def item_names
        @items.map(&:name)
    end

    def unpopular_items
        unpopular_items = []
        #require 'pry' ; binding.pry
        @items.each do |item|
            unpopular_items << item if item.bids.empty?
        end
        unpopular_items
    end

    def potential_revenue
        total_revenue = 0
        @items.each do |item|
          total_revenue += item.bids.values.sum
        end
        total_revenue
    end

    def add_bidder(attendee)
        @bidders ||= []
        @bidders << attendee.name unless @bidders.include?(attendee.name)
    end
    
    def bidders
        @bidders || []
    end
    
    def bidder_info
        bidder_info_hash = {}
    
        @items.each do |item|
          item.bids.each do |attendee, bid_amount|
            if bidder_info_hash[attendee].nil?
              bidder_info_hash[attendee] = { budget: attendee.budget.to_i, items: [] }
            end
    
            bidder_info_hash[attendee][:items] << item.name
          end
        end
    
        bidder_info_hash
    end
end