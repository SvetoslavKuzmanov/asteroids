module Asteroids
  class ShipPhysics < Component

    def initialize(game_object, object_pool)
       super(game_object)
       @object_pool = object_pool
       object.x, object.y = $window.width / 2, $window.height / 2
    end

    def update
      if $window.button_down? Gosu::KbUp
        accelerate
      end
      if $window.button_down? Gosu::KbLeft
        object.angle -= 4.5
      end
      if $window.button_down? Gosu::KbRight
        object.angle += 4.5
      end
      move
    end

    private

    def accelerate
      object.vel_x += Gosu::offset_x(object.angle, 0.5)
      object.vel_y += Gosu::offset_y(object.angle, 0.5)
    end

    def move
      object.x += object.vel_x
      object.y += object.vel_y
      object.x %= 800
      object.y %= 600
      object.vel_x *= 0.95
      object.vel_y *= 0.95
    end

  end
end