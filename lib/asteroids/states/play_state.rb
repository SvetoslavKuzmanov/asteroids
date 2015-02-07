module Asteroids
  class PlayState < GameState

    def initialize
      @background = Gosu::Image.new($window,
        Utils.get_image_path('background.png'), false)
      @object_pool = ObjectPool.new
      @ship = Ship.new(@object_pool)
      Utils.create_asteroids(@object_pool, 4)
    end

    def draw
      @background.draw(0, 0, 0)
      @object_pool.objects.map(&:draw)
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