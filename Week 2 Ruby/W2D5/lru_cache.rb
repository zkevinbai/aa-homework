# assume our input is limited to Fixnums, Strings, Arrays, Symbols, and Hashes. 
# We will allow the user to set the size of the cache.

class LRUCache
    def initialize(len = 1)
        @len = len
        @cache = []
    end 

    def count
      # returns number of elements currently in cache
      @cache.length
    end

    def add(el)
      # adds element to cache according to LRU principle
        if self.count == @len && @cache.include?(el)
            @cache.delete(el)
            @cache.push(el)
        elsif self.count == @len && @cache.include?(el) == false
            @cache.shift
            @cache.push(el)
        elsif self.count < @len && @cache.include?(el) == false
            @cache.push(el)
        end 
    end

    def show
      # shows the items in the cache, with the LRU item first
      p @cache
    end

    private
    # helper methods go here!

  end


johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

johnny_cache.show 

# prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
