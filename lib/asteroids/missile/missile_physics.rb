module Asteroids
  class MissilePhysics < Component

    def initialize(game_object, object_pool)
       super(game_object)
       @object_pool = object_pool
    end

    def update
      object.mark_for_removal if detect_collision?
      object.x += Gosu::offset_x(object.angle, 10) + object.vel_x
      object.y += Gosu::offset_y(object.angle, 10) + object.vel_y
      object.x %= 800
      object.y %= 600
      object.lifespan -= 0.1
      object.mark_for_removal if object.lifespan <= 0
    end

    def detect_collision?
      @object_pool.objects.each do |other_object|
        if other_object.is_a? Asteroids::Asteroid and
          Utils.collide(object, other_object)
            object.ship.add_score(calculate_points(other_object))
            return true
        end
      end
      return false
    end

    def calculate_points(asteroid)
      case asteroid.radius
      when 45
        20
      when 30
        50
      when 17.5
        100
      end
    end

  end
end