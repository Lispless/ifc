class Generic
  attr_accessor :hit_box
  def initialize(window, x, y)
    @window = window
    @x = x
    @width = 25
    @y = y
    @height = 46
    puts "window: #{@window}"
    @ship = Gosu::Image.new(@window, "media/generic.png", true)
    @hit_box = HitBox.new(@x,@y, @width, @height)
    @hit_points = 1
    @alive = true
  end

  def damage
    @hit_points - 1
    if @hit_points < 1
      @alive = false
    end
  end

  def update(x, y)
    @x = x
    @y = y
  end

  def route1
    @x += 1
    @y += 1
  end

  def route2
    @x -= 1
    @y += 1
  end

  def draw
    if @alive == true
      @ship.draw(@x, @y, 2)
    end
  end
end
