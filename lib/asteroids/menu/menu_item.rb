module Asteroids
  class MenuItem
    attr_writer :x, :y

    def initialize (text, callback, selected)
      @image = Gosu::Image.from_text($window, text,
        Utils.get_font_path('victor-pixel.ttf'), 65)
      @x = 0
      @y = 0
      @callback = callback
      @selected = selected
    end

    def draw
      if @selected
          @image.draw(@x, @y, 10, 1, 1, 0xffffff00)
      else
          @image.draw(@x, @y, 10)
      end
    end

    def is_selected?
      @selected
    end

    def select
      @selected = true
    end

    def deselect
      @selected = false
    end

    def execute
      if @selected
          @callback.call
      end
    end

    def width
      @image.width
    end

    def height
      @image.height
    end

  end
end