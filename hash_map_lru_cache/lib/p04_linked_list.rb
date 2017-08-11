class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @next.prev = @prev
    @prev.next = @next
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each { |el| return el.val if el.key == key }
    nil
    # temp = @head.next
    # until temp == @tail || temp.key == key
    #   temp = temp.next
    # end
    #
    # temp.val
  end

  def include?(key)
    self.each { |el| return true if el.key == key }
    false


    # temp = @head.next
    # until temp == @tail || temp.key == key
    #   temp = temp.next
    # end
    #
    # unless temp == @tail
    #   return true
    # end
    # false
  end

  def append(key, val)
    temp = Node.new(key,val)
    temp.prev = @tail.prev
    temp.next = @tail
    @tail.prev = temp
    temp.prev.next = temp
  end

  def update(key, val)
    self.each { |el| el.val = val if el.key == key }
  end

  def remove(key)
    self.each do |el|
      if el.key == key
        el.prev.next = el.next
        el.next.prev = el.prev
        break
      end
    end
  end

  def each
    temp = @head.next
    until temp == @tail
      yield temp
      temp = temp.next
    end
  end

  #Uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
