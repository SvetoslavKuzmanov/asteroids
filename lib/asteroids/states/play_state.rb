module Asteroids
  class PlayState < GameState

    def initialize
      @background = Gosu::Image.new($window,
        Utils.get_image_path('background.png'), false)
      @live_image = Gosu::Image.new($window,
        Utils.get_image_path('ship_small.png'), false)
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
      else
        @font.draw("Score: ", 580, 10, 50, 1.0, 1.0, 0xffffff00)
        @font.draw(@ship.score, 700, 10, 50, 1.0, 1.0, 0xffffff00)
        @font.draw("Lives: ", 10, 10, 50, 1.0, 1.0, 0xffffff00)
        @ship.lives.times do |n|
          @live_image.draw(110 + n * 50, 10, 50)
        end
      end
    end

    def update
      @object_pool.update_all
    end

    def button_down(id)
      if id == Gosu::KbEscape
        Asteroids::GameState.switch(Asteroids::MenuState.instance)
      end
      if id == Gosu::KbS
        serialized_object = ::YAML::dump(@object_pool)
        File.open(Utils.saves_path + '/save.yaml', 'w+') do |file|
         file.write(serialized_object)
         end
      end
    end

  end
end