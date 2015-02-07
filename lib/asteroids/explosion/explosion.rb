module Asteroids
  class Explosion < GameObject

  def initialize(object_pool, x, y)
    super(object_pool)
    @x, @y = x, y
    @current_frame = 0
    ExplosionGraphics.new(self)
  end

  end
end