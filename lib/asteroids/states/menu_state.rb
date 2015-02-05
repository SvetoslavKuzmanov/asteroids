require 'singleton'

module Asteroids
  class MenuState < GameState
    include Singleton

    def initialize
      @title = Gosu::Image.from_text($window, "Asteroids",
        Utils.get_font_path('victor-pixel.ttf'), 100)
      @background = Gosu::Image.new($window,
        Utils.get_image_path('background.png'), false)
    end

    def update

    end

    def draw
      @background.draw(0,0,0)
      @title.draw(
        $window.width / 2 - @title.width / 2,
        $window.height / 5 - @title.height / 5,
        10)
    end

    def button_down(id)
      $window.close if id == Gosu::KbQ
    end

  end
end