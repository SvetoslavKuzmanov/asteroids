module Asteroids
  class MissilePhysics < Component

    def initialize(game_object, object_pool)
       super(game_object)
       @object_pool = object_pool
    end

    def update
      object.x += Gosu::offset_x(object.angle, 10) + object.vel_x
      object.y += Gosu::offset_y(object.angle, 10) + object.vel_y
      object.x %= 800
      object.y %= 600
      object.lifespan -= 0.1
    end

  end
end