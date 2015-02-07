module Asteroids
  class Utils

    def self.assets_path
      File.expand_path("../../../../assets/", __FILE__)
    end

    def self.get_image_path(image_name)
      "#{assets_path}/images/#{image_name}"
    end

    def self.get_font_path(font_name)
      "#{assets_path}/fonts/#{font_name}"
    end

    def self.collide(object_a, object_b)
      if Gosu::distance(object_a.x, object_a.y, object_b.x, object_b.y) <
           object_a.radius + object_b.radius
          return true
      end
      false
    end

  end
end