class Ravine
	def initialize(window)
		@window = window
		@stage_y = -9000
		@ravine = Gosu::Image.new(@window, "media/ravine_unflourish.png", true)
		@wave1 = []
		@wave2 = []
		@time = 0
	end

	def update(window)
		@stage_y += 1

		case
  	when @time == 180
    	@wave1 << Generic.new(@window, 0, 50)
  	when @time == 240
    	@wave1 << Generic.new(@window, 0, 50)
  	when @time == 320
    	@wave1 << Generic.new(@window, 0, 50)
  	when @time == 380
    	@wave1 << Generic.new(@window, 0, 50)
  	when @time == 440
    	@wave1 << Generic.new(@window, 0, 50)
  	end

  	@wave1.each do |e|
  		e.route1
  	end

  	case
  	when @time == 840
    	@wave2 << Generic.new(@window, 500, 50)
  	when @time == 900
    	@wave2 << Generic.new(@window, 500, 50)
  	when @time == 960
    	@wave2 << Generic.new(@window, 500, 50)
  	when @time == 1020
    	@wave2 << Generic.new(@window, 500, 50)
  	when @time == 1080
    	@wave2 << Generic.new(@window, 500, 50)
  	end

  	@wave2.each do |e|
  		e.route2
  	end

  	@time += 1
	end

	def group1
		@wave1.each do |e|
		end
	end

	def group2
		@wave2.each do |e|
		end
	end

	def draw
		@ravine.draw(0, @stage_y, 0, 1, 1)

		@wave1.each do |e|
			e.draw
		end

		@wave2.each do |e|
			e.draw
		end
	end
end
