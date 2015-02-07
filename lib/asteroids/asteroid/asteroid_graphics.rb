module Asteroids
  class AsteroidGraphics < Component

    def initialize(game_object)
       super(game_object)
        @image = Gosu::Image.new($window,
         Utils.get_image_path("asteroid.png"), true)
        @image_medium = Gosu::Image.new($window,
         Utils.get_image_path("asteroid_medium.png"), true)
        @image_small = Gosu::Image.new($window,
         Utils.get_image_path("asteroid_small.png"), true)
    end

    def draw
      case object.radius
      when 45
        @image.draw_rot(object.x, object.y, 1, object.angle)
      when 30
          @image_medium.draw_rot(object.x, object.y, 1, object.angle)
      when 17.5
          @image_small.draw_rot(object.x, object.y, 1, object.angle)
      end
    end

  end
end