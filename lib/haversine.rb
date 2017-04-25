class Haversine
  def initialize latitude, longitude, radius
    @lat1 = to_radians(latitude.to_f)
    @long1 = to_radians(longitude.to_f)
    @radius = radius.to_i
  end

  def distance latitude, longitude
    lat = to_radians(latitude.to_f)
    long = to_radians(longitude.to_f)
    if long < @long1
      @lat2 = @lat1
      @long2 = @long1
      @lat1 = lat
      @long1 = long
    else
      @lat2 = lat
      @long2 = long
    end

    @radius * c
  end

  def to_radians degrees
    degrees * Math::PI / 180
  end

  def to_degrees radians
    radians * 180 / Math::PI
  end

  def a
    delta_lat = @lat2 - @lat1
    delta_long = @long2 - @long1
    Math.sin(delta_lat/2)**2 + Math.cos(@lat1) * Math.cos(@lat2) * Math.sin(delta_long/2)
  end

  def c
    2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
  end
end
