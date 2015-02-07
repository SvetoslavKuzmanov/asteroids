module Asteroids
  class ObjectPool
    attr_accessor :objects

    def initialize
      @objects = []
    end

    def update_all
      @objects.map(&:update)
      @objects.delete_if { |object| object.removable?}
    end

    def find_empty_space
      x = Gosu::random(0, 800)
      y = Gosu::random(0, 600)
      while is_not_empty(x, y)
        x = Gosu::random(0, 800)
        y = Gosu::random(0, 600)
      end
      {x: x, y: y}
    end

    def is_not_empty(x, y)
      @objects.each do |object|
        if object.is_a? Asteroids::Asteroid and object.x == x and object.y == y
          return true
        end
      end
      false
    end

  end
end