module Asteroids
  class ShipGraphics < Component

    def initialize(game_object)
      super(game_object)
      @image = Gosu::Image.load_tiles($window,
       Utils.get_image_path("ship.png"), 90, 90, true)
    end

    def draw
        @image[1].draw_rot(x, y, 1, angle)
    end

  end
end