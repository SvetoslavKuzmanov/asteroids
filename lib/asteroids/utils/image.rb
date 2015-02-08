module Asteroids
    class Gosu::Image
    alias_method :old_initialize, :initialize

    def initialize(window, file_name, tileable = false)
      @file_name = file_name
      old_initialize(window, file_name, tileable)
    end

    def _dump(depth)
      @file_name.to_s
    end

    def self._load(file_name)
      new($window, file_name)
    end
  end
end