module Asteroids
  class Asteroid < GameObject

    attr_accessor :x, :y, :vel_x, :vel_y, :angle, :radius

    def initialize(object_pool, x, y, vel_x, vel_y, angle, radius = 45)
      super(object_pool)
      @x = x
      @y = y
      @angle = angle
      @vel_x = vel_x
      @vel_y = vel_y
      @physics = AsteroidPhysics.new(self, object_pool)
      @graphics = AsteroidGraphics.new(self)
      @radius = radius
    end

    def explode
      Explosion.new(object_pool, @x, @y)
    end

  end
end