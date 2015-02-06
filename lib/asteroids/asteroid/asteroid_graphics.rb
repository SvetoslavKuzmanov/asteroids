module Asteroids
  class AsteroidGraphics < Component

    def initialize(game_object)
       super(game_object)
        @image = Gosu::Image.new($window,
         Utils.get_image_path("asteroid.png"), true)
    end

    def draw
      @image.draw_rot(object.x, object.y, 1, object.angle)
    end

  end
end