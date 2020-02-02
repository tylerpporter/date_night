require_relative 'node.rb'

class BinarySearchTree
  attr_reader :root, :in_order_traversal, :health_stats, :total_nodes

  def initialize
    @root = nil
    @in_order_traversal = []
    @health_stats = []
    @total_nodes = 1
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
  #   #starter code to return desired result for depth of 0, root node
  #   # health_stats = []
  #   # if node.depth == depth
  #   #   child_nodes = self.sort.size
  #   #   total_nodes = @in_order_traversal.size
  #   #   depth_stats = [node.key, child_nodes, ((child_nodes / total_nodes) * 100)]
  #   #   health_stats << depth_stats
  #   # else
  #   #   nil
  #   # end
  #   # health_stats
    if depth != node.depth
      health(depth, node.left) unless node.left.nil?

    else
      child_nodes = sort(node).size.to_f
      percent = ((child_nodes / @total_nodes) * 100).to_i
      depth_stats = [node.key, child_nodes, percent]
      @health_stats << depth_stats
    
    end
    @health_stats
  end

end
