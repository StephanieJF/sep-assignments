class HashClass

  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    i = index(key, size)
    to_insert = HashItem.new(key, value)
    return if @items[i] == to_insert
    if @items[i].nil?
      @items[i] = to_insert
    elsif @items[i].key == key
      @items[i] = to_insert
    else
      while @items[i] != nil && @items[i] != value do
        resize
      end
      @items[i] = to_insert
    end
  end

  ##IF collection[index] === to_insert
    ##Do Nothing
  ##ELSIF collection[index].nil?
    ####Insert
  ##ELSIF collection[index].key === to_insert.key
    ##Update value
  ##ELSIF collision
    ##Resize

  def [](key)
    i = index(key, size)
    if @items[i] != nil
      @items[i].value
    end
  end

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