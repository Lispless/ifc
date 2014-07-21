require 'gosu'
require 'pry'

require_relative 'lib/menu.rb'
require_relative 'lib/stages/ravine_unflourish.rb'
require_relative 'lib/player.rb'
require_relative 'lib/collision_objects/hit_box.rb'
require_relative 'lib/collision_objects/hit_area.rb'
require_relative 'lib/collision_objects/bullet.rb'
require_relative 'lib/enemy_routes/route1.rb'
require_relative 'lib/enemies/generic.rb'

class Game <Gosu::Window
	attr_accessor :testing

	def initialize
		super(500, 1000, false)
		@state = :menu
		@menu = Menu.new(self)
		@player = Player.new(self, 250, 950)
		@ravine = Ravine.new(self)
		@bullets = []
		@testing = true
		@count = 0
	end

	def collision?(obj_a, obj_b)
		if obj_a.hit_box.right >= obj_b.hit_box.left &&
			obj_a.hit_box.left <= obj_b.hit_box.right &&
			obj_a.hit_box.top <= obj_b.hit_box.bottom &&
			obj_a.hit_box.bottom >= obj_b.hit_box.top
			true
		else
			false
		end
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

    if @state == :level_1
    	@ravine.enemies.each do |enemy|
    		@bullets.each do |bullet|
					if collision?(bullet, enemy) == true
						bullet.damage
						enemy.damage
					end
				end
			end

			@ravine.enemies = @ravine.enemies.reject { |enemy| enemy.destroyed? }
    	@bullets = @bullets.reject { |bullet| bullet.destroyed? }

	    if button_down?(Gosu::KbLeft)
	    	@player.left
	    elsif
	    	button_down?(Gosu::KbRight)
	    	@player.right
	    end

	    if button_down?(Gosu::KbUp)
	    	@player.up
	    elsif
				button_down?(Gosu::KbDown)
	    	@player.down
	    end

	    if button_down?(Gosu::KbSpace)
	    	@bullets << @player.shoot
	    	@bullets.each do |b|
	    		b.draw
	    	end
	    end

	    if @state == :level_1
	    	@ravine.update(self)
    	end

    	@player.update

    	@bullets.each do |b|
    		b.update(self)
    	end
    end
	end

	def draw
		if @state == :level_1
			@ravine.draw
			@player.draw
			@bullets.each do |b|
				b.draw
			end
		elsif @state == :menu
			@menu.draw
		end
	end

	def game_over

	end
end

Game.new.show
