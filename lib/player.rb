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
	end

	def left
		if @x <= 0
			@x += 0
		else
			@x -= 4
		end
	end

	def right
		@right_side = @x + @width
		if @right_side >= 500
			@right_side += 500
		else
			@x += 4
		end
	end

	def up
		if @y <= 0
			@y += 0
		else
			@y -= 6
		end
	end

	def down
		@botton_side = @y + @height
		if @botton_side >= 1000
			@botton_side = 1000
		else
			@y += 3
		end
	end

	def shoot
		Bullet.new(@window, @x, @y)
	end

	def horizontal_collision?(collision_obj)
		if @hit_box.left < 200
			self.up
		end
	end

	def update

	end

	def draw
		@ship.draw(@x, @y, 1)
	end
end
