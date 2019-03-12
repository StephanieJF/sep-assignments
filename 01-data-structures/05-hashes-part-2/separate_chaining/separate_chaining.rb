require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @items = Array.new(size)
    @max_load_factor = 0.7
    @size = size
    @num_items = 0
    @num_resizes = 0
  end


  def []=(key, value)
    i = index(key, size)
    current = Node.new(key, value)
    if @items[i] == nil
      @items[i] = LinkedList.new
    end

    @items[i].add_to_tail(current)
    @num_items +=1

    if load_factor > @max_load_factor
      resize
      @num_resizes +=1
    end
  end


  def [](key)
    i = index(key, size)
    current_node = @items[i].head
    loop do
      return current_node.value if current_node.key == key
      current_node = current_node.next
      break if current_node == nil
    end
  end


  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @num_items.to_f / size
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    @size *= 2
    resized_hash = Array.new(@size)
    @items.each do |bucket|
      if bucket != nil
        current_node = bucket.head
        loop do
          i = index(current_node.key, resized_hash.size)
          resized_hash[i] = LinkedList.new if resized_hash[i] == nil
          resized_hash[i].add_to_tail(Node.new(current_node.key, current_node.value))
          current_node = current_node.next
          break if current_node == nil
        end
      end
    end
    @items = resized_hash
  end

  def print_hash
    @items.each_with_index do |bucket, index|
      if bucket != nil
        puts "\nIndex- #{index} "
        current_node = bucket.head
        loop do
          puts "Key: #{current_node.key}, Value: #{current_node.value}"
          current_node = current_node.next
          break if current_node == nil
        end
      end
    end
    puts "\nThis hash contains #{@num_items} in an array of size #{@size}. It had to be resized #{@num_resizes} #{@num_resizes == 1 ? 'time' : 'times'} and the current load factor is: #{load_factor}."
  end
end

shelter_dogs = SeparateChaining.new(6)
=begin
shelter_dogs["Name"] = "Buddy"
shelter_dogs["Name"] = "Navi"
shelter_dogs["Name"] = "Dobby"
shelter_dogs["Name"] = "Troy"
shelter_dogs["Name"] = "Willa"
shelter_dogs["Name"] = "Deja"
=end


shelter_dogs["Buddy"] = "Shi Tzu Mix"
shelter_dogs["Navi"] = "Beagle"
shelter_dogs["Dobby"] = "Brown Lab"
shelter_dogs["Troy"] = "Hound Mix"
shelter_dogs["Willa"] = "Coon Hound"
shelter_dogs["Deja"] = "Pit Mix"


shelter_dogs.print_hash