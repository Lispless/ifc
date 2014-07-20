class Route1
  attr_accessor :x, :y
  def initialize
    @path_x = x
    @path_y = y
  end

  def update
    @path_x += 1
    @path_y += 1
  end

  def draw

  end
end
