class HashMap
	attr_accessor :load_factor, :capacity, :buckets

	def initialize(load_factor = 0.75, capacity = 16)
		@load_factor = load_factor
		@capacity = capacity
		@buckets = Array.new(capacity) { [] }
	end

	def hash(key)
	hash_code = 0
	prime_number = 31

	key.each_char do |char|
	 hash_code = prime_number * hash_code + char.ord
	 end

	 hash_code
	 end

	 def index(key)
	 hash(key) % @capacity
	 end

	 def set(key, value)
	 i = index(key)
	 bucket = @buckets[i]

	 pair = bucket.find { |k, _| k == key}

	 if pair
	 pair[1] = value
	 else
	 bucket << [key, value]
	 end
  end
    def get(key)
    i = index(key)
    bucket = @buckets[i]

    pair = bucket.find { |k, _| k == key}
    pair ? pair[1] : nil
     end 

     def has?(key)
     	i = index(key)
     	bucket = @buckets[i]

     	bucket.any? {|k, _| k == key}
     end

     def remove(key)
     	i = index(key)
     	bucket = @buckets[i]

     	pair = bucket.find {|k, _| k == key}
     	return nil unless pair

     	bucket.delete(pair)
     	pair[1]
     end

     def length
     	@buckets.sum { |bucket| bucket.length }
     end

     def clear
     	@buckets = Array.new(@capacity) { [] }
     end

     def keys
     	@buckets.flat_map { |bucket| bucket.map {|k, _| k}  }
     end

     def values
     	@buckets.flat_map { |bucket| bucket.map { |_, v| v}}
     end

     def entries
     	@buckets.flatten(1)
     end
end

map = HashMap.new
map.set("nome", "Carlos")
puts map.get("nome")
puts map.has?("nome")