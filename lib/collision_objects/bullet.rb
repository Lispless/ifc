class Bullet
	attr_reader :x, :y
	def initialize(window, x, y)
		@window = window
		@bullet_x = x += 11
		@bullet_y = y
		@bullet = Gosu::Image.new(@window, "media/bullet.png", true)
		@destroyed = false
	end

	def update(window)
		@bullet_y -= 5
	end

	def draw
		@bullet.draw(@bullet_x, @bullet_y, 1)
	end
end
