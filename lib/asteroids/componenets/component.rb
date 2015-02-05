module Asteroids
  class Component

    def initialize(game_object = nil)
      self.object = game_object
    end

    def update
    end

    def draw
    end

    protected

    def object=(obj)
      if obj
        @object = obj
        obj.components << self
      end
    end

    def object
      @object
    end

  end

end