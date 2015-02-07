module Asteroids
  class Ship < GameObject

    SHOOT_DELAY = 600

    attr_accessor :x, :y, :vel_x, :vel_y, :angle, :thrust, :radius, :score

    def initialize(object_pool)
      super(object_pool)
      @physics = ShipPhysics.new(self, object_pool)
      @graphics = ShipGraphics.new(self)
      @vel_x = @vel_y = @angle = 0.0
      @radius = 35
      @lives = 3
      @score = 0
      @object_pool = object_pool
    end

    def shoot
      if can_shoot?
        @last_shot = Gosu.milliseconds
        Missile.new(self, object_pool, @x, @y, @vel_x, @vel_y, @angle)
      end
    end

     def can_shoot?
      Gosu.milliseconds - (@last_shot || 0) > SHOOT_DELAY
    end

    def explode
      Explosion.new(object_pool, @x, @y)
      @lives -= 1
      spawn
    end

    def is_alive?
      return true if @lives != 0 or @lives > 0
    end

    def spawn
      @x = object_pool.find_empty_space[:x]
      @y = object_pool.find_empty_space[:y]
    end

    def add_score(points)
      @score += points
    end

  end
end