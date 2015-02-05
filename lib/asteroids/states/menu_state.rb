require 'singleton'

module Asteroids
  class MenuState < GameState
    include Singleton

    def initialize
      @message = Gosu::Image.from_text(
        $window, "Asteroids", Gosu.default_font_name, 100)
    end

    def update

    end

    def draw
      @message.draw(
        $window.width / 2 - @message.width / 2,
        $window.height / 5 - @message.height / 5,
        10)
    end

    def button_down(id)
      $window.close if id == Gosu::KbQ
    end

  end
end