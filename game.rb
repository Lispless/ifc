require 'gosu'

require_relative 'lib/menu.rb'
require_relative 'lib/stages/ravine_unflourish.rb'
require_relative 'lib/player.rb'

class Game <Gosu::Window

	def initialize
		super(500, 1000, false)
		@menu = Menu.new(self)
		@player = Player.new(self, 250, 950)
		@ravine = Ravine.new(self)
	end

	def update

		if button_down?(Gosu::KbEscape)
      close
    end

	end

	def draw
		if @level_1 == true
			@ravine.draw
			@player.draw
		else
			@menu.draw
		end
	end

	def game_over

	end
end

Game.new.show
