class Pages < Application

  def index
    @trip = Trip.new
    render :template => "pages/#{params[:title] || 'index' }"
  end

  
  
end
