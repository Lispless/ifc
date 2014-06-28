class Player
	def initialize(window, x, y)
		@window = window
		@ship_x = x
		@ship_y = y
		@ship = Gosu::Image.new(@window, "media/ship.png", true)
	end

	def update

	end

	def draw
		@ship.draw(@ship_x, @ship_y, 1)
	end
end
