class Trip
  include DataMapper::Resource
  
  ON = [:weekdays, :weekday_and_saturday, :weekends, :all_days]
  property :id, Serial
  property :out_time, Integer, :nullable => false
  property :in_time, Integer, :nullable => false
  property :on, Enum.send('[]',*ON)
  
  property :deleted_at, ParanoidDateTime

  belongs_to :start_stop, :model => Stop, :child_key => [:start_stop_id], :nullable => false
  belongs_to :end_stop, :model => Stop, :child_key => [:end_stop_id], :nullable => false

  belongs_to :user, :nullable => false
  
  def self.on
    ON
  end

  def start_trips
    start_stop.nearby_stops.starts
  end

  def end_trips
    end_stop.nearby_stops.ends
  end

  def nearby_trips
    (start_trips & end_trips).uniq
  end

  def description
    "#{start_stop.name} to #{end_stop.name} on #{on.to_s}. Out at #{out_time}. Back at #{in_time}"
  end

  def self.popular
  end


end
