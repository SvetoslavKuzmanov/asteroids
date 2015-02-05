module Asteroids
  class Ship < GameObject

    attr_accessor :x, :y, :vel_x, :vel_y, :angle, :thrust

    def initialize(object_pool)
      super(object_pool)
    end

  end
end