require 'gosu'

require_relative 'lib/menu.rb'
require_relative 'lib/stages/ravine_unflourish.rb'
require_relative 'lib/player.rb'

class Game <Gosu::Window

	def initialize
		super(500, 1000, false)
		@state = :menu
		@menu = Menu.new(self)
		@player = Player.new(self, 250, 950)
		@ravine = Ravine.new(self)
	end

	def update
		if button_down?(Gosu::KbEscape)
	      close
	    end

		if @state == :menu
	    @menu.update(self)
	  end

	  menu_select = @menu.update(self)
    if menu_select == "start"
    	@state = :level_1
    end

    if button_down?(Gosu::KbLeft)
    	@player.left
    end

    if button_down?(Gosu::KbRight)
    	@player.right
    end

    if button_down?(Gosu::KbUp)
    	@player.up
    end

    if button_down?(Gosu::KbDown)
    	@player.down
    end

    if button_down?(Gosu::KbSpace)
    	@player.shoot
    end

    if @state == :level_1
    	@ravine.update(self)
    end
	end

	def draw
		if @state == :level_1
			@ravine.draw
			@player.draw
		elsif @state == :menu
			@menu.draw
		end
	end

	def game_over

	end
end

Game.new.show
