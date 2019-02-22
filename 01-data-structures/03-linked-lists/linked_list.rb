require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head.next == nil
      @tail = nil
    else
      current_node = @head
      while current_node.next != @tail
        current_node = current_node.next
      end
      current_node.next = nil
      @tail = current_node
    end
  end

  # This method prints out a representation of the list.
  def print
    current_node = @head
    while current_node != @tail
      puts current_node.data
      current_node= current_node.next
    end
    puts current_node.data
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node == @tail
      remove_tail
    elsif
      node == @head
      @head = @head.next
    end

    if
      current_node = @head
      while current_node != nil && current_node.next != nil && current_node.next != node
        current_node = current_node.next
      end
      if current_node != nil && current_node.next != nil
        current_node.next = current_node.next.next
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next = @head
      @head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    temp = @head
    @head = @head.next
    temp
  end

  #This method finds the `num`th element in a linked list (to be used for benchmark testing compared to
  # the array method of `array[num]`)
  def find_node(num)
    count = 1
    current = @head
    while current != nil
      if count == num
        return current.data
      else
        current = current.next
        count +=1
      end
    end
  end
end