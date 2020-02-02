require_relative 'node.rb'

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(score, title)
    if @root.nil?
      @root = Node.new(score, title, -1)
      @root.depth
    else
      @root.insert_node(score, title)
    end
  end
  

end
