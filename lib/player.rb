class Player
	attr_accessor :hit_box
	def initialize(window, x, y)
		@window = window
		@x = 250
		@width = 25
		@y = 800
		@height = 46
		@ship = Gosu::Image.new(@window, "media/ship.png", true)
		@hit_box = HitBox.new(@x,@y, @width, @height)
		@hit_points = 1
		@alive = true
	end

	def left
		if @x <= 10
			@x = 10
		else
			@x -= 4
		end
	end

	def right
		@right_side = @x + @width
		if @right_side >= 490
			@right_side += 490
		else
			@x += 4
		end
	end

	def up
		if @y <= 10
			@y = 10
		else
			@y -= 6
		end
	end

	def down
		@botton_side = @y + @height
		if @botton_side >= 990
			@botton_side = 990
		else
			@y += 3
		end
	end

	def shoot
		Bullet.new(@window, @x, @y)
	end

	def damage
		@hit_points - 1
		if @hit_points < 1
			@alive = false
		end
	end

	def update
		if @alive == false
			close
		end
	end

	def draw
		@ship.draw(@x, @y, 2)
	end
end
