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
      mark_for_removal
    end

  end
end