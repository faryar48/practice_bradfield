# given the binary tree, do any of the root-to-leaf paths add up to 22, n 

class TreeNode 
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val 
    @left, @right = nil, nil 
  end 
end 

root = TreeNode.new(5)
root.left = TreeNode.new(4)
root.right = TreeNode.new(8)
root.left.left = TreeNode.new(11)
root.left.left.left = TreeNode.new(7)
root.left.left.right = TreeNode.new(2)
root.right.left = TreeNode.new(13)
root.right.right = TreeNode.new(4)
root.right.right.right = TreeNode.new(1)

def depth(root)
  stack = [root]
  until stack.empty? 
    node = stack.pop
    p node.val
    stack.push(node.right) if node.right 
    stack.push(node.left) if node.left 
  end 
end 

# depth(root)


def breadth(root)
  queue = [root]
  until queue.empty? 
    node = queue.shift
    p node.val 
    queue.push(node.left) if node.left 
    queue.push(node.right) if node.right 
  end 
end 

# breadth(root)



def depth_recursion(node)
  return if node.nil? 
  p node.val 
  depth_recursion(node.left)
  depth_recursion(node.right)
end 

# depth_recursion(root)


def depth_recursion_two(sum, node)
  p "#{sum} : #{node.val}"
  if node.left.nil? && node.right.nil? && node.val == sum 
    return true 
  end 
  new_sum = sum - node.val 
  return (node.left && depth_recursion_two(new_sum, node.left)) || (node.right && depth_recursion_two(new_sum, node.right)) 
end 

p depth_recursion_two(22, root)







