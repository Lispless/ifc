class HitBox
  attr_reader :width, :height
  attr_accessor :x, :y

  def initialize(x_start,y_start,width,height)
    @x = x_start
    @y = y_start
    @width = width
    @height = height
  end

  def left
    @x
  end

  def right
    @x + @width
  end

  def bottom
    @y + @height
  end

  def top
    @y
  end

  def contains_point?(x,y)
    if x >= left && x <= right && y >= bottom && y <= top
      true
    else
      false
    end
  end
end
