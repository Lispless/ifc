class Bullet
	def initialize(x, y)
		@bullet_x = x
		@bullet_y = y
		@bullet = Gosu::Image.new(@window, "media/bullet.png", true)
	end

	def update

	end

	def draw
		@bullet.draw(@bullet_x, @bullet_y)
	end
end
