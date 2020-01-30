class Node
  attr_reader :key, :left, :right, :movie, :depth

  def initialize(score, title, depth)
    @movie = {title => score}
    @key = @movie.values[0]
    @left = nil
    @right = nil
    @depth = depth + 1
  end

  def insert_node(score, title)
    if {title => score}.values[0] < @key
      if @left.nil?
          @left = Node.new(score, title, depth)
          @left.depth
      else
        @left.insert_node(score, title)
      end
    elsif {title => score}.values[0] > @key
      if @right.nil?
        @right = Node.new(score, title, depth)
        @right.depth
      else
        @right.insert_node(score, title)
      end
    end
  end

end
