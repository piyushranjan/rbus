class StartStop
  include DataMapper::Resource
  
  property :id, Serial
  
  belongs_to :trip
  belongs_to :stop

end
