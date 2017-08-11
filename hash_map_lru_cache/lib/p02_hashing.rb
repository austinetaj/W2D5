class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = 100000
    self.each_with_index do |el, idx|
      sum += ((((idx*el.to_s.ord).abs) +1).hash % 123) * 500
    end
    sum
  end
end

class String
  def hash
    array = self.chars
    array.hash

  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    temp = self.to_a.sort.flatten
    temp.hash
  end
end
