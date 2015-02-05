module Asteroids
  class GameObject

    def initialize(object_pool)
      @components = []
      @object_pool = object_pool
      @object_pool.objects << self
    end

    def components
      @components
    end

    def update
    end

    def draw()
    end

    def removable?
      @removable
    end

    def mark_for_removal
      @removable = true
    end

  end
end