class LRUCache
    def initialize(max_length)
      @cache = []
      @max_length = max_length
    end

    def count
      # returns number of elements currently in cache
      @cache.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      if count >= @max_length
        remove_from_full(el)
      end 
       
      @cache.push(el) 
    end

    def show
      # shows the items in the cache, with the LRU item first
      @cache.dup
    end

    private
    
    def remove_from_full(el)
      if @cache.find_index(el)
        @cache.delete(el)
      else
        @cache.shift
      end
    end 

  end