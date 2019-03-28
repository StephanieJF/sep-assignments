require_relative 'node'
require 'benchmark'

class BinaryHeap
	attr_accessor :root

  def initialize(root)
		@root = root
  end

def insert(root, node, children = nil)
  next_children = []
  if children.nil?
    children = []
    children << root
  end
  children.each do |child|
    if child.left.nil?
      child.left = node
      next_children = []
      break
    elsif child.right.nil?
      child.right = node
      next_children = []
      break
    elsif child.left.rating < node.rating
      temp = child.left
      child.left = node
      next_children = []
      self.insert(root, temp)
    elsif child.right.rating < node.rating
      temp = child.right
      child.right = node
      next_children = []
      self.insert(root, temp)
    else
      next_children << child.left
      next_children << child.right
    end
  end
  unless next_children.empty?
    self.insert(root, node, next_children)
  end
end

	def find(root, data)
		return nil if root.nil? || data.nil?
		if root.title == data
      return root
    elsif right_child = find(root.right, data)
      return right_child
    elsif left_child = find(root.left, data)
      return left_child
    end
  end


	def delete(root, data)
    to_delete = find(root, data)
    if root.nil? || data.nil?
      return nil
    else
      if to_delete.nil?
        return nil
      else
        to_delete.title = nil
        to_delete.rating = nil
      end
    end
	end

	def printf(children=nil)
    if root.nil?
      return nil
    end
    queue = []
    queue.push(@root)
    while queue.length > 0
      current_node = queue.shift()
      puts "#{current_node.title}: #{current_node.rating}"
      queue.push(current_node.left) if current_node.left != nil
      queue.push(current_node.right) if current_node.right != nil
    end
  end
end
