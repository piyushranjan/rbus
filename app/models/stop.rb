class Stop
  include DataMapper::Resource
  
  property :id, Serial
  property :name, String
  property :latitude, Float
  property :longitude, Float

  has n, :starts, :model => Trip, :child_key => [:start_stop_id]
  has n, :ends, :model => Trip, :child_key => [:end_stop_id]

  def nearby_stops
    Stop.all(:latitude.gte => latitude - 0.01,
             :latitude.lte => latitude + 0.01,
             :longitude.gte => longitude - 0.01,
             :longitude.lte => longitude + 0.01)
  end

  def nearby_trips
    (nearby_stops.starts + nearby_stops.ends).uniq
  end

  def self.popular_starts
    Trip.all.map{|t| t.start_stop}.inject(Hash.new(0)) { |h,v| h[v.id] += 1; h }
  end

  def self.popular_ends
    Trip.all.map{|t| t.end_stop}.inject(Hash.new(0)) { |h,v| h[v.id] += 1; h }
  end


end

