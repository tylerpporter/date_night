class Node

  def initialize(score, title)
    @movie = {title => score}
    @key = @movie.values[0]
    @left = nil
    @right = nil
  end

end
