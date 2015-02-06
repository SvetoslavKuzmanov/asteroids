module Asteroids
  class MissileGraphics < Component

    def initialize(game_object)
       super(game_object)
       @image = Gosu::Image.new($window,
        Utils.get_image_path("simple_missile.png"), true)
    end

    def draw
      @image.draw_rot(object.x, object.y, 0, object.angle)
    end

  end
end