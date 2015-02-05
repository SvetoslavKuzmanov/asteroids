module Asteroids
  class Menu
    def initialize ()
      @items = []
    end

    def add_item (image, callback, selected)
      item = MenuItem.new(image, callback, selected)
      @items << item
      item.x = position[:x]
      item.y = position[:y]
    end

    def draw
      @items.each do |i|
          i.draw
      end
    end

    def position
      {x: $window.width / 2 - @items[@items.count - 1].width / 2,
       y: $window.height / 3  - @items[@items.count - 1].height / 3 +
        @items.count * 60 }
    end

    def select_item(which)
      @items.each_with_index do |item, index|
        if item.is_selected?
          if @items[index.send(which, 1) % 3].select
            item.deselect
            return true
          end
        end
      end
    end

    def confirm
      @items.each do |item|
        if item.is_selected?
          item.execute
        end
      end
    end

  end
end