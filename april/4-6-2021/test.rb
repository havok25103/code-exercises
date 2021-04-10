require_relative './binary-tree-balanced'

describe 'is_binary_tree_balanced?' do
  it 'should be true for empty tree' do
    expect(is_binary_tree_balanced?(nil)).to eq true
  end

  it 'should be true for single node tree' do
    root = BinaryTreeNode.new 1
    expect(is_binary_tree_balanced?(root)).to eq true
  end

  it 'should be true for a balanced tree' do
    root = BinaryTreeNode.new 100
    root.left = BinaryTreeNode.new 50
    root.left.left = BinaryTreeNode.new 25
    root.left.right = BinaryTreeNode.new 75
    root.right = BinaryTreeNode.new 150
    root.right.left = BinaryTreeNode.new 125
    root.right.right = BinaryTreeNode.new 175

    expect(is_binary_tree_balanced?(root)).to eq true
  end

  it 'should be false for an unbalanced tree' do
    root = BinaryTreeNode.new 100
    root.left = BinaryTreeNode.new 50
    root.left.left = BinaryTreeNode.new 25
    root.left.left.left = BinaryTreeNode.new 15
    root.left.left.left.right = BinaryTreeNode.new 20
    root.right = BinaryTreeNode.new 150
    root.right.left = BinaryTreeNode.new 125

    expect(is_binary_tree_balanced?(root)).to eq false
  end
end