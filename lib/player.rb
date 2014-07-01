class Player
	def initialize(window, x, y)
		@window = window
		@x = x
		@y = y
		@ship = Gosu::Image.new(@window, "media/ship.png", true)
	end

	def left
		@x -= 4
	end

	def right
		@x += 4
	end

	def up
		@y -= 4
	end

	def down
		@y += 4
	end

	def update

	end

	def draw
		@ship.draw(@x, @y, 1)
	end
end
