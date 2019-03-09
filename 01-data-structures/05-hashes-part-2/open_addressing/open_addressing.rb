require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    new_node = Node.new(key, value)
    i = next_open_index(index(key, size))

    if @items[i] && @items[i].key == key
      @items[i] = value
    else
      while i == -1
        resize
        i = next_open_index(index(key, size))
      end
    end
    @items[i] = new_node
  end

  def [](key)
    i = index(key, size)
    @items.each do |item|
      if item != nil && item.key == key
        return item.value
      end
    end
    @items[i].value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    if @items[index] != nil
      loop do
        index += 1
        break if @items[index] == nil || index >= @items.size
      end
    end
    if index >= @items.size
      index = -1
    end
    index
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    @size *=2
    resized_hash = Array.new(@size)
    @items.each do |item|
      if item != nil
        resized_hash[index(item.key, @size)] = item
      end
    end
    @items = resized_hash
  end
end