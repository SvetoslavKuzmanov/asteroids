module Asteroids
  class PlayState < GameState

    def initialize
      @background = Gosu::Image.new($window,
        Utils.get_image_path('background.png'), false)
      @object_pool = ObjectPool.new
      @ship = Ship.new(@object_pool)
      create_asteroids(4)
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

    def create_asteroids(amount)
      amount.times do |n|
       Asteroid.new(@object_pool, rand(800), rand(600),
       rand() * 0.6 - 0.3, rand() * 0.6 - 0.3, 0)
     end
    end

  end
end