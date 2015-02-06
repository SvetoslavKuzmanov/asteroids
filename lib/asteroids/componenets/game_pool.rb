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

  end
end