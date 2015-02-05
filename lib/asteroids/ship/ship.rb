module Asteroids
  class Ship < GameObject

    attr_accessor :x, :y, :vel_x, :vel_y, :angle, :thrust

    def initialize(object_pool)
      super(object_pool)
      @physics = ShipPhysics.new(self, object_pool)
      @graphics = ShipGraphics.new(self)
      @vel_x = @vel_y = @angle = 0.0
    end

  end
end