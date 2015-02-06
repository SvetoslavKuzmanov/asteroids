module Asteroids
  class Missile < GameObject

    attr_accessor :x, :y, :vel_x, :vel_y, :angle, :lifespan

    def initialize(object_pool)
      super(object_pool)
    end

  end
end