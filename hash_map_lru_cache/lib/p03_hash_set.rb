require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if (@count + 1 ) >= num_buckets
    unless self.include?(key)
      # puts self.[](num)
      self[key] << key
      @count += 1
    end
  end

  def remove(key)
    self[key].delete(key)
  end

  def include?(key)
    self[key].include?(key)
  end

  private

  def [](key)
    # optional but useful; return the bucket corresponding to `key`
    @store[key.hash % num_buckets]
    # p @store[key.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    num_bucks = num_buckets * 2
    temp_store = Array.new(num_bucks) { Array.new }
    @store.each do |bucket|
      bucket.each do |el|
        temp_store[el.hash % num_bucks] << el
      end
    end
    @store = temp_store
  end
end
