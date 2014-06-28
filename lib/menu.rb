class Menu
	def initialize(window)
		@window = window
		@bg = Gosu::Image.new(@window, "media/menu.png", true)
		@menu_arrow = Gosu::Image.new(@window, "media/menu_arrow.png", true)
		@font = Gosu::Font.new(@window, "Tahoma", 50)
	end

	def update

	end

	def draw
		@bg.draw(0, 0, 0)
		@font.draw("Incarnae Flare Crepusculem", 8, 10, 1, 1, 1, 0xff0000ff)
		@font.draw("Play", 180, 450, 1, 1, 1, 0xff0000ff)
		@font.draw("Options", 180, 500, 1, 1, 1, 0xff0000ff)
	end
end
