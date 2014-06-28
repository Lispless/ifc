class Ravine
	def initialize(window)
		@window = window
		@stage_y = -9000
		@ravine = Gosu::Image.new(@window, "media/ravine_unflourish.png", true)
	end

	def update(window)
		@stage_y += 1
	end

	def draw
		@ravine.draw(0, @stage_y, 0, 1, 1)
	end
end
