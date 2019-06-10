# !/usr/bin/ruby
#
class Stack
  def initialize
    @data = []
  end

  def push(element)
    @data.push(element)
  end

  def pop
    @data.pop
  end

  def empty?
    @data.empty?
  end
end

class Node
	attr_reader :value
	attr_accessor :left, :right

	def initialize(value=nil)
		@value = value
		left = nil;
		right = nil;
	end
end

class Tree
	attr_accessor :root_node

	def initialize(root_value=nil)
		@root_node = Node.new(root_value)
	end

  def print_parcours_infixe
    current = root_node
    stack = Stack.new

    while true do
      if !current.nil?
        stack.push(current)
        current = current.left
      else
        if stack.empty?
          break
        else
          current = stack.pop
          print "#{current.value} "
          current = current.right
        end
      end
    end
  end

	def search(value, node=nil)
		node = root_node if node.nil?

    return node if value == node.value

    if (!node.left.nil?)
      return node.left if search(value, node.left)
    end

    if (!node.right.nil?)
      return node.right if search(value, node.right)
    end
	end

	def delete(value)
		node = search(value)
		if !node.nil?
			remove(node)
		end
	end

	def remove(node)
		if node.left.nil? && node.right.nil?
			node = nil
		elsif !node.left.nil? && node.right.nil?
			node = node.left
		elsif node.left.nil? && !node.right.nil?
			node = node.right
		else
			node = delete_node_with_two_children(node)
		end
		node
	end

  private
  def delete_node_with_two_children(node)
    min_node = find_min_node(node.right)
    replace_value(min_node, node)
    remove_min_node(min_node)
  end
  def remove_min_node(min_node)
    min_node = nil
  end
  def find_min_node(node)
    if node.left.nil?
      min_node = node
      return min_node
    else
      find_min(node.left)
    end
  end
  def replace_value(min_node, node)
    node.value = min_node.value
  end
end

tree = Tree.new(1)
tree.root_node.left  = Node.new(2)
tree.root_node.right = Node.new(3)
tree.root_node.left.left  = Node.new(7)
tree.root_node.left.right = Node.new(8)
tree.root_node.right.left  = Node.new(4)
tree.root_node.right.right = Node.new(5)

puts tree.print_parcours_infixe
puts tree.search(3)

