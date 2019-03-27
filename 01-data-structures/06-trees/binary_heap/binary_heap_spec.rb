include RSpec

require_relative 'binary_heap'

RSpec.describe BinaryHeap, type: Class do
  let (:root) { Node.new("Clash of the Titans", 68) }

  let (:heap) { BinaryHeap.new(root) }
	let (:frankenstein) { Node.new("Young Frankenstein", 93) }
	let (:goodfellas) { Node.new("Goodfellas", 96) }
	let (:naked_gun) { Node.new("The Naked Gun: From the Files of Police Squad!", 87) }
	let (:wayne) { Node.new("Wayne's World", 84) }
	let (:professional) { Node.new("The Professional", 72) }
	let (:pretty) { Node.new("Pretty Woman", 62) }
	let (:best) { Node.new("Best In Show", 94) }
	let (:help) { Node.new("Help!", 92) }
	let (:misery) { Node.new("Misery", 89) }
	let (:unfaithful) { Node.new("Unfaithful", 50) }
	let (:celeste_jesse) { Node.new("Celeste and Jesse Forever", 71) }
	let (:mary) { Node.new("There's Something About Mary", 83) }

	describe "#insert(node)" do
     it "properly inserts a new node as a left child" do
       heap.insert(root, frankenstein)
       expect(root.left.title).to eq "Young Frankenstein"
     end

     it "properly inserts a new node as a right child" do
     		heap.insert(root, frankenstein)
        heap.insert(root, goodfellas)
        expect(root.right.title).to eq "Goodfellas"
     end

		 it "properly inserts a new node and it swaps according to the min heap property" do
			 heap.insert(root, goodfellas)
			 heap.insert(root, best)
			 heap.insert(root, celeste_jesse)
			 expect(root.left.left.title).to eq "Celeste and Jesse Forever"
		 end
	 end

	describe "#find(data)" do
    it "properly finds a left node" do
      heap.insert(root, wayne)
      heap.insert(root, misery)
      expect(heap.find(root, wayne.title).title).to eq "Wayne's World"
    end

		it "properly finds a right node" do
			heap.insert(root, wayne)
			heap.insert(root, misery)
			expect(heap.find(root, misery.title).title).to eq "Misery"
		end
	end

	describe "#delete(data)" do
    it "properly deletes a left node" do
      heap.insert(root, help)
      heap.delete(root, help.title)
      expect(heap.find(root, help.title)).to be_nil
    end
	end

	describe "#printf" do
		 specify {
			 expected_output = "Clash of the Titans: 68\nBest In Show: 94\nYoung Frankenstein: 93\nMisery: 89\nWayne's World: 84\n"
			 heap.insert(root, wayne)
			 heap.insert(root, misery)
			 heap.insert(root, frankenstein)
			 heap.insert(root, best)
			 expect { heap.printf }.to output(expected_output).to_stdout
		 }
	 end
 end
