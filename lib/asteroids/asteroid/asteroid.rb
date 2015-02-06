module Asteroids
  class Asteroid < GameObject

    attr_accessor :x, :y, :vel_x, :vel_y, :angle

    def initialize(object_pool, x, y, vel_x, vel_y, angle)
      super(object_pool)
      @x = x
      @y = y
      @angle = angle
      @vel_x = vel_x
      @vel_y = vel_y
      @physics = AsteroidPhysics.new(self, object_pool)
      @graphics = AsteroidGraphics.new(self)
    end

  end
end