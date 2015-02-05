module Asteroids
  class ShipPhysics < Component

    def initialize(game_object, object_pool)
       super(game_object)
       @object_pool = object_pool
       object.x, object.y = $window.width / 2, $window.height / 2
    end


  end
end