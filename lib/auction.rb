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
end