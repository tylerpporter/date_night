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

  def test_it_can_verify_presence_of_score
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal true, @tree.include?(16)
    assert_equal false, @tree.include?(45)
  end

  def test_it_can_return_the_depth_of_a_given_node
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 1, @tree.depth_of(92)
    assert_equal 2, @tree.depth_of(50)
    assert_nil @tree.depth_of(42)
  end

  def test_it_can_return_the_movie_with_max_score
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")
    @tree.insert(93, "Seven")

    assert_equal ({"Seven"=>93}), @tree.max
  end

  def test_it_can_return_the_movie_with_min_score
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")
    @tree.insert(14, "Cats")

    assert_equal ({"Cats"=>14}), @tree.min
  end

  def test_it_can_sort_nodes_ascending
    sorted = [{"Johnny English"=>16}, {"Hannibal Buress: Animal Furnace"=>50}, {"Bill & Ted's Excellent Adventure"=>61}, {"Sharknado 3"=>92}]
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal sorted, @tree.sort
  end

  def test_it_can_use_file_data_to_add_nodes

    assert_equal 99, @tree.load('./lib/movies.txt')
  end

  def test_it_can_report_health_at_given_depth
    @tree.insert(98, "Animals United")
    @tree.insert(58, "Armageddon")
    @tree.insert(36, "Bill & Ted's Bogus Journey")
    @tree.insert(93, "Bill & Ted's Excellent Adventure")
    @tree.insert(86, "Charlie's Angels")
    @tree.insert(38, "Charlie's Country")
    @tree.insert(69, "Collateral Damage")

    assert_equal [[98, 7, 100]], @tree.health(0)
    assert_equal [[58, 6, 85]], @tree.health(1)
    assert_equal [[36, 2, 28], [93, 3, 42]], @tree.health(2)
  end

  def test_it_can_return_number_of_leaves
    @tree.insert(98, "Animals United")
    @tree.insert(58, "Armageddon")
    @tree.insert(36, "Bill & Ted's Bogus Journey")
    @tree.insert(93, "Bill & Ted's Excellent Adventure")
    @tree.insert(86, "Charlie's Angels")
    @tree.insert(38, "Charlie's Country")
    @tree.insert(69, "Collateral Damage")

    assert_equal 2, @tree.leaves
  end

end
