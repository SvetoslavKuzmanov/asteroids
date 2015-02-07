module Asteroids
  class Ship < GameObject

    SHOOT_DELAY = 600

    attr_accessor :x, :y, :vel_x, :vel_y, :angle, :thrust, :radius

    def initialize(object_pool)
      super(object_pool)
      @physics = ShipPhysics.new(self, object_pool)
      @graphics = ShipGraphics.new(self)
      @vel_x = @vel_y = @angle = 0.0
      @radius = 35
      @lives = 3
      @object_pool = object_pool
    end

    def shoot
      if can_shoot?
        @last_shot = Gosu.milliseconds
        Missile.new(object_pool, @x, @y, @vel_x, @vel_y, @angle)
      end
    end

     def can_shoot?
      Gosu.milliseconds - (@last_shot || 0) > SHOOT_DELAY
    end

    def explode
      Explosion.new(object_pool, @x, @y)
      if out_of_lives
        mark_for_removal
      else
        spawn
        @lives -= 1
      end
    end

    def out_of_lives
      true if @lives <= 0
    end

    def spawn
      @x = object_pool.find_empty_space[:x]
      @y = object_pool.find_empty_space[:y]
    end

  end
end