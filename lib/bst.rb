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

  def include?(score, node = @root)
    if score < node.key
      include?(score, node.left)
    elsif score > node.key
      include?(score, node.right)
    else
      node.key == score
    end
  end

  def depth_of(score, node = @root)
    if score < node.key
      depth_of(score, node.left)
    elsif score > node.key
      depth_of(score, node.right)
    else
      node.depth
    end
  end

  def max(node = @root)
    node = node.right
    if node.right != nil
      max(node)
    else
      node.movie
    end
  end

  def min(node = @root)
    node = node.left
    if node.left != nil
      min(node)
    else
      node.movie
    end
  end

end
