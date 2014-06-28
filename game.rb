require 'gosu'

require_relative 'lib/menu.rb'

class Game <Gosu::Window

	def initialize
		super(500, 1000, false)
		@menu = Menu.new(self)
	end

	def update

		if button_down?(Gosu::KbEscape)
      close
    end

	end

	def draw
		@menu.draw
	end

	def game_over

	end
end

Game.new.show
