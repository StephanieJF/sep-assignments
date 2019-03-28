require_relative 'node'

class BinarySearchTree

	attr_accessor :root

  def initialize(root)
		@root = root
  end

	def insert(root, node)
	#uses depth first search to find the appropriate place to add the data and adds
	#it as a new Leaf
	if root.rating == node.rating
		return root
	end
	if root == nil
		root = node
	elsif root.rating > node.rating
		if root.left.nil?
			root.left = node
		else
			insert(root.left, node)
		end
	else
		if root.right.nil?
			root.right = node
		else
			insert(root.right, node)
		end
	end
		return node
	end

  # Recursive Depth First Search
	def find(root, data)
		#returns a Node object which contains the data, if found.
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
					return  nil
				else
					to_delete.title = nil
					to_delete.rating = nil
				end
	    end
		end

  # Recursive Breadth First Search
	def printf(children=nil)
    if root.nil?
      return nil
    end
    queue = []
    queue.push(root)
    while queue.length > 0
      current_node = queue[0]
      queue.push(current_node.left) if current_node.left
      queue.push(current_node.right) if current_node.right
      to_print = queue.shift()
      puts "#{to_print.title}: #{to_print.rating}"
    end
  end
end
