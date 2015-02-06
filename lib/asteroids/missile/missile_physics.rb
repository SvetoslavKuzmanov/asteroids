module Asteroids
  class MissilePhysics < Component

    def initialize(game_object, object_pool)
       super(game_object)
       @object_pool = object_pool
    end

  end
end