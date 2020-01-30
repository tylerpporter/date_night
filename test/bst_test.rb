require 'minitest/autorun'
require 'minitest/pride'
require './lib/bst.rb'
require './lib/node.rb'

class BinarySearchTreeTest < Minitest::Test

  def setup
    @tree = BinarySearchTree.new
  end

  def test_it_exists
    assert_instance_of BinarySearchTree, @tree
  end

  def test_it_creates_a_root_node
    @tree.insert(89, "Seven")
    assert_instance_of Node, @tree.root
  end 

end
