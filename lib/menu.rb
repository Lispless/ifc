class Menu
	attr_writer :menu_select
	def initialize(window)
		@window = window
		@menu_select = nil
		@bg = Gosu::Image.new(@window, "media/menu.png", true)
		@menu_arrow = Gosu::Image.new(@window, "media/menu_arrow.png", true)
		@font = Gosu::Font.new(@window, "Tahoma", 50)
		@select = 1
	end

	def update(window)
		if window.button_down?(Gosu::KbDown)
			@select = 2
		elsif window.button_down?(Gosu::KbUp)
			@select = 1
		end

		if window.button_down?(Gosu::KbReturn) && @select == 1
			@menu_select = "start"
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
