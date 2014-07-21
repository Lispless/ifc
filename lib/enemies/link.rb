class Link
  attr_accessor :hit_box
  def initialize(window, x, y)
    @window = window
    @x = x
    @width = 250
    @y = y
    @height = 25
    @ship = Gosu::Image.new(@window, "media/link.png", true)
    @hit_points = 1000
    @alive = true
  end

  def hit_box
    @hit_box = HitBox.new(@x,@y, @width, @height)
  end

  def damage
    @hit_points -= 1
    if @hit_points < 1
      @alive = false
    end
  end

  def update

  end

  def route1
    @y += 1
  end

  def route2
    @x = 125
    @y = 200
  end

  def draw
    if @alive == true
      @ship.draw(@x, @y, 2)
    end
  end
end
