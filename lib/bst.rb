class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(score, title)
    if @root.nil?
      @root = Node.new(score, title, -1)
    else
      @root.node_insert(score, title)
    end
  end
  
end
