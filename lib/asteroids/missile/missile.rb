module Asteroids
  class Missile < GameObject

    attr_accessor :ship, :x, :y, :vel_x, :vel_y, :angle, :lifespan, :radius

    def initialize(ship, object_pool, x, y, vel_x, vel_y, angle)
      super(object_pool)
      @x = x
      @y = y
      @angle = angle
      @vel_x = vel_x
      @vel_y = vel_y
      @lifespan = 3
      @radius = 3
      @ship = ship
      @physics = MissilePhysics.new(self, object_pool)
      @graphics = MissileGraphics.new(self)
    end

  end
end