require 'singleton'

module Asteroids
  class MenuState < GameState
    include Singleton

    def initialize
      @title = Gosu::Image.from_text($window, "Asteroids",
        Utils.get_font_path('victor-pixel.ttf'), 100)
      @background = Gosu::Image.new($window,
        Utils.get_image_path('background.png'), false)
      @menu = Menu.new
      @menu.add_item("New Game", lambda { GameState.switch(PlayState.new) },
        true)
      @menu.add_item("Load Game",
       lambda do
        GameState.switch(PlayState.new(Utils.saves_path + '/save.yaml'))
        end,
       false)
      @menu.add_item("Exit", lambda { $window.close }, false)
    end

    def draw
      @background.draw(0, 0, 0)
      @title.draw(
        $window.width / 2 - @title.width / 2,
        $window.height / 5 - @title.height / 5,
        10)
      @menu.draw
    end

    def button_down(id)
      if id == Gosu::KbDown
        @menu.select_item(:+)
      end
      if id == Gosu::KbUp
        @menu.select_item(:-)
      end
      if id == Gosu::KbReturn
        @menu.confirm
      end
    end

  end
end