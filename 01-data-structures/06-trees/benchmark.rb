require 'benchmark'
require_relative './binary_heap/binary_heap.rb'
require_relative './binary_tree/binary_search_tree.rb'

n = 100000
root = Node.new("root", 1)
heap = BinaryHeap.new(root)
tree = BinarySearchTree.new(root)
rand_node = Node.new("random", rand(2..n))

Benchmark.bm do |benchmark|
	benchmark.report("create binary tree") do
		99999.times do
			tree.insert(root, rand_node)
		end
	end

	# benchmark.report("create binary heap") do
	# 	99999.times do
	# 		heap.insert(root, rand_node)
	# 	end
	# end

	benchmark.report("tree-find 50000") do
		tree.find(root, 50000)
	end

	# benchmark.report("heap-find 50000") do
	# 	heap.find(root, 50000)
	# end

	benchmark.report("tree-delete 50000") do
		tree.delete(root, 50000)
	end

	# benchmark.report("heap-delete 50000") do
	# 	heap.delete(root, 50000)
	# end
end
