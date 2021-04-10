# Implement a function to check if a binary tree is balanced.
# For the purpose of this question, a balanced tree is defined
# to be a tree such that the heights of the two subtrees of any
# never differ by more than one.

class BinaryTreeNode
  attr_accessor :data, :left, :right

  def initialize data
    @data = data
  end
end

def check_height root
  return -1 if root == nil
  
  left_height = check_height root.left
  return nil if left_height == nil

  right_height = check_height root.right
  return nil if right_height == nil

  height_diff = left_height - right_height
  if height_diff.abs > 1
    return nil  
  else
    return [left_height, right_height].max + 1
  end
end

def is_binary_tree_balanced? root
  return check_height(root) != nil
end
