require 'minitest/autorun'
require 'minitest/pride'
require './lib/node.rb'

class NodeTest < Minitest::Test

  def setup
    @node = Node.new(89, "Seven", -1)
  end

  def test_it_exists
    assert_instance_of Node, @node
  end

  def test_it_stores_movie_data
    assert_equal ({"Seven"=>89}), @node.movie
  end

  def test_it_can_store_a_key_value
    assert_equal 89, @node.key
  end

  def test_it_can_store_left_and_right_objects
    assert_nil @node.left
    assert_nil @node.right
  end

  def test_node_insert_assigns_node_to_correct_arm
    @node.insert_node(92, "Fight Club")
    @node.insert_node(85, "Burn After Reading")

    assert_equal ({"Fight Club" => 92}), @node.right.movie
    assert_equal ({"Burn After Reading" => 85}), @node.left.movie
  end

  def test_it_keeps_building_the_tree
    @node.insert_node(16, "Johnny English")
    @node.insert_node(92, "Sharknado 3")
    @node.insert_node(50, "Hannibal Buress")

    assert_equal ({"Hannibal Buress" => 50}), @node.left.right.movie
  end

  def test_it_knows_and_returns_its_depth
    @node.insert_node(16, "Johnny English")
    @node.insert_node(92, "Sharknado 3")
    @node.insert_node(50, "Hannibal Buress")

    assert_equal 2, @node.left.right.depth
    assert_equal 2, @node.insert_node(5, "Cats")
  end

end
