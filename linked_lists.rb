require './node.rb'

class LinkedList

	attr_reader :size
	def initialize
		@head=nil
		@tail=nil
		@size=0
	end

	def append(data)
		node = Node.new(data)
		@tail.next_node = node unless @tail == nil
		@tail = node
		@head = node if @size == 0
		@size = @size + 1
		node.value
	end

	def prepend(data)
		node = Node.new(data)
		node.next_node = @head
		@head = node
		@tail = node if @size == 0
		@size = @size + 1
		node.value
	end

	def size
		@size
	end

	def head
		@head.value if @head != nil
	end

	def tail
		@tail.value if @tail != nil
	end

	def at(index)
		c = 0
		position = @head
		until c == index
			c = c + 1
			position = position.next_node
		end		
		return position.value
	end

	def pop
		if size > 0
			node = @head
			while node.next_node != @tail do 
				node = node.next_node
			end

			node_pop = @tail
			node.next_node = nil
			@tail = node
			@size = size - 1
		end
	end

	def contains?(data)
		node = @head
		return true if node.value == data
		until node.next_node == nil
			node = node.next_node
			return true if node.value == data
		end
		false
	end

	def find(data)
		node = @head
		count = 0
		while node.value != data
			count += 1
			if node.next_node == nil
				return "List doesn't contain #{data}"
			end
			node = node.next_node
		end
		count
	end

	def to_s
		node = @head
		string = ""
		until node == nil
			string += "(#{node.value}) ->"
			node = node.next_node
		end
		string += "(nil)"
	end


end


list = LinkedList.new()
puts list.append("ev")
puts list.append("starr")
puts list.prepend("ida")
puts list.contains?("ev")
puts list.find("evie")
puts list.to_s



