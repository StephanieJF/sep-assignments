class HashClass

  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    i = index(key, size)
    if @items[i] == nil
      @items[i] = HashItem.new(key, value)
    elsif @items[i].key == key
      @items[i] = HashItem.new(key, value)
    else
      resize
    end
    @items[i] = HashItem.new(key, value)
  end


  def [](key)
   @items[index(key, size)]

  end

  def resize
    new_size = @size * 2
    resize_hash = Array.new(new_size)
    @items.each do |item|
      if item != nil
        resize_hash[index(item.key, new_size)] = item
      end
    end
    @items = resize_hash
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

end