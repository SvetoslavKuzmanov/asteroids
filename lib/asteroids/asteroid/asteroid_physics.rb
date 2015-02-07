module Asteroids
  class AsteroidPhysics < Component

    def initialize(game_object, object_pool)
       super(game_object)
       @object_pool = object_pool
    end

    def update
      if detect_collision?
        @explosion_time = Gosu.milliseconds
        object.explode
      end
      if @explosion_time
        if Gosu.milliseconds - @explosion_time  > 100
          object.mark_for_removal
          if object.radius == 45
            2.times do |n|
              Asteroid.new(@object_pool, object.x + rand(20),
               object.y + rand(20), rand * (-1.5), rand() * 1.5, rand * 3,
                (object.radius - 15))
            end
          end
          if object.radius == 30
            2.times do |n|
              Asteroid.new(@object_pool, object.x + rand(20),
               object.y + rand(20), rand() * (-2.2), rand() * 2.2, rand  * 3,
                (object.radius - 12.5))
            end
          end
        end
      end
      object.x += Gosu::offset_x(object.angle, 0.0001) + object.vel_x
      object.y += Gosu::offset_y(object.angle, 0.0001) + object.vel_y
      object.x %= 800
      object.y %= 600
    end

    def detect_collision?
      @object_pool.objects.each do |other_object|
        if other_object.is_a?  Asteroids::Missile or
          other_object.is_a?  Asteroids::Ship and
          Utils.collide(object, other_object)
            return true
        end
      end
      return false
    end

  end
end