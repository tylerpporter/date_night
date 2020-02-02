require_relative 'node.rb'

class BinarySearchTree
  attr_reader :root, :in_order_traversal, :health_stats, :total_nodes, :leaves

  def initialize
    @root = nil
    @in_order_traversal = []
    @health_stats = []
    @total_nodes = 1
    @leaves = []
  end

  def insert(score, title)
    if @root.nil?
      @root = Node.new(score.to_i, title, -1)
      @root.depth
    else
      @root.insert_node(score.to_i, title)
      @total_nodes += 1
    end
  end

  def include?(score, node = @root)
    return false if node.nil?
    if score < node.key
      include?(score, node.left)
    elsif score > node.key
      include?(score, node.right)
    else
      node.key == score
    end
  end

  def depth_of(score, node = @root)
    return if node.nil?
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

  def sort(node = @root)
    sort(node.left) unless node.left.nil?
    @in_order_traversal << node.movie
    sort(node.right) unless node.right.nil?
    @in_order_traversal
  end

  def load(filename)
    movie_storage = []
    File.open(filename).each {|line| movie_storage << line.chomp().split(',')}
    movie_storage.each {|movie| self.insert(movie[0], movie[1])}
    movie_storage.size
  end

  def health(depth, node = @root)
    @health_stats = [] if node == @root
    if depth != node.depth
      health(depth, node.left) unless node.left.nil?
      health(depth, node.right) unless node.right.nil?
    else
      child_nodes = sort(node).size.to_f
      percent = ((child_nodes / @total_nodes) * 100).to_i
      depth_stats = [node.key, child_nodes.to_i, percent]
      @health_stats << depth_stats
      @in_order_traversal = []
    end
    @health_stats
  end

  def leaves(node = @root)
    if node.left.nil? && node.right.nil?
      @leaves << node
    else
      leaves(node.left) unless node.left.nil?
      leaves(node.right)unless node.right.nil?
    end
    @leaves.size
  end

  def height(node = @root)
    leaves()
    deepest_node = @leaves.max_by {|node| node.depth}
    deepest_node.depth
  end

end
