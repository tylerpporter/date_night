require 'minitest/autorun'
require 'minitest/pride'
require './lib/node.rb'

class NodeTest < Minitest::Test
  def test_it_exists
    node = Node.new(89, "Seven")

    assert_instance_of Node, node
  end 

end
