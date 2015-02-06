module Asteroids
  class ShipGraphics < Component

    def initialize(game_object)
      super(game_object)
      @image = Gosu::Image.load_tiles($window,
       Utils.get_image_path("ship.png"), 90, 90, true)
    end

    def draw
      if object.thrust
        @image[0].draw_rot(object.x, object.y, 1, object.angle)
      else
        @image[1].draw_rot(object.x, object.y, 1, object.angle)
      end

    end

  end
end