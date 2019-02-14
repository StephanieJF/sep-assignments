class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack << item
    self.top = @stack[-1]
    self.top = item
  end

  def pop
    item = self.top
    @stack.delete(self.top)
    self.top = @stack[-1]
    item
  end

  def empty?
    @stack.length == 0
  end
end