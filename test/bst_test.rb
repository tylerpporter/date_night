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

  def test_it_creates_a_tree_of_nodes
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal ({"Johnny English" => 16}), @tree.root.left.movie
    assert_equal ({"Sharknado 3" => 92}), @tree.root.right.movie
  end
end
