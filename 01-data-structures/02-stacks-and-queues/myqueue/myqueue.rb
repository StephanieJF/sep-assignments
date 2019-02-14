class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def enqueue(element)
    @queue << element
    self.head = @queue.first
    self.tail = @queue.last
  end

  def dequeue
    temp = @queue[0]
    @queue.delete(temp)
    self.head = @queue.first
    self.tail = @queue.last
    temp
  end

  def empty?
    @queue.length == 0
  end
end