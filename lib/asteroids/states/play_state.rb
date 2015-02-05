module Asteroids
  class PlayState < GameState

    def initialize
      @background = Gosu::Image.new($window,
        Utils.get_image_path('background.png'), false)
    end

    def draw
      @background.draw(0, 0, 0)
    end

    def update
    end

    def button_down(id)
    end

  end
end