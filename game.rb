require 'gosu'

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
		@enemies = []
	end

	def collision?(collision_obj, colliding_obj)
		if colliding_obj.hit_box.right >= collision_obj.hit_box.left
			@x - 1
			colliding_obj.damage
			collision_obj.damage
		elsif colliding_obj.hit_box.left <= collision_obj.hit_box.right
			@x + 1
			colliding_obj.damage
			collision_obj.damage
		elsif colliding_obj.hit_box.top <= collision_obj.hit_box.botom
			@y + 1
			colliding_obj.damage
			collision_obj.damage
		elsif colliding_obj.hit_box.bottom >= collision_obj.hit_box.top
			@y -1
			colliding_obj.damage
			collision_obj.damage
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

  def button_down(id)
    if id == (Gosu::KbT)
      @testing == true ? @testing = false : @testing = true
    end
  end

  def draw_rect(x, y, width, height, color = 0xff0000ff, z = 10)
    #left side
    draw_line(x,y,color,x, y+height, color, z)
    #right side
    draw_line(x+width, y, color, x+width, y+height, color, z)
    #top
    draw_line(x,y,color,x+width, y, color, z)
    #bottom
    draw_line(x, y+height, color, x+width, y+height, color, z)
    # draw_quad(x, y, color,
    #   x + width, y, color,
    #   x + width, y + height, color,
    #   x, y + height, color, z)
  end

	def game_over

	end
end

Game.new.show
