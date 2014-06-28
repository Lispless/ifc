class Menu
	def initialize(window)
		@window = window
		@bg = Gosu::Image.new(@window, "media/menu.png", true)
		@menu_arrow = Gosu::Image.new(@window, "media/menu_arrow.png", true)
		@font = Gosu::Font.new(@window, "Tahoma", 50)
		@select = 1
		@level_1 = false
	end

	def update

	end

	def button_down(id)
		if id == Gosu::KbUp
			@select -= 1
			if @select < 1
				@select = 2
			end
		elsif id == Gosu::KbDown
			@select += 1
			if @select > 2
				@select = 1
			end
		elsif id == Gosu::KbReturn
			if @select == 1
				@level_1 = true
			elsif @select == 2
			end
		end
	end

	def draw
		@bg.draw(0, 0, 0)
		@font.draw("Incarnae Flare Crepusculem", 8, 10, 1, 1, 1, 0xff0000ff)
		@font.draw("Play", 180, 450, 1, 1, 1, 0xff0000ff)
		@font.draw("Options", 180, 500, 1, 1, 1, 0xff0000ff)
		if @select == 1
			@menu_arrow.draw(100, 450, 1)
		elsif @select == 2
			@menu_arrow.draw(100, 500, 1)
		end
	end
end
