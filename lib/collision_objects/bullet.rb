class Bullet
	attr_accessor :hit_box
	attr_reader :x, :y
	def initialize(window, x, y)
		@window = window
		@bullet_x = x += 11
		@width = 3
		@bullet_y = y
		@height = 5
		@bullet = Gosu::Image.new(@window, "media/bullet.png", true)
		@alive = true
		@hit_points = 1
	end

	def hit_box
    @hit_box = HitBox.new(@bullet_x,@bullet_y, @width, @height)
  end

	def damage
    @hit_points -= 1
    if @hit_points < 1
      @alive = false
    end
  end

	def update(window)
		@bullet_y -= 5
	end

	def draw
		if @alive == true
			@bullet.draw(@bullet_x, @bullet_y, 1)
		end
	end
end
