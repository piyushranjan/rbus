class Pages < Application

  def show
    render :template => "pages/#{params[:name] || 'index' }"
  end

  
  
end
