module Asteroids
  class PlayState < GameState

    def initialize
      @background = Gosu::Image.new($window,
        Utils.get_image_path('background.png'), false)
      @object_pool = ObjectPool.new
      @ship = Ship.new(@object_pool)
      Utils.create_asteroids(@object_pool, 4)
            @font = Gosu::Font.new($window,
       Utils.get_font_path('victor-pixel.ttf'),
        34)
    end

    def draw
      @background.draw(0, 0, 0)
      @object_pool.objects.map(&:draw)
      if !@ship.is_alive?
        @font.draw("Game Over", 210, 250, 50, 2.0, 2.0, 0xffffff00)
      end
    end

    def update
      @object_pool.update_all
    end

    def button_down(id)
      if id == Gosu::KbEscape
        Asteroids::GameState.switch(Asteroids::MenuState.instance)
      end
    end

  end
end