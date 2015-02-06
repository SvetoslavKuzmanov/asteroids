module Asteroids
  class Missile < GameObject

    attr_accessor :x, :y, :vel_x, :vel_y, :angle, :lifespan

    def initialize(object_pool, x, y, vel_x, vel_y, angle)
      super(object_pool)
      @physics = MissilePhysics.new(self, object_pool)
      @graphics = MissileGraphics.new(self)
    end

  end
end