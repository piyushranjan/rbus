class Stops < Application
  provides :xml, :yaml, :js

  def index
    if params[:q]
      @stops = params[:q].length>2 ? Stop.all(:name.like => "%#{params[:q]}%") : []
    else
      @stops = Stop.all
    end
    display @stops
  end

  def show(id)
    @stop = Stop.get(id)
    raise NotFound unless @stop
    display @stop
  end

  def new
    only_provides :html
    @stop = Stop.new
    display @stop
  end

  def edit(id)
    only_provides :html
    @stop = Stop.get(id)
    raise NotFound unless @stop
    display @stop
  end

  def create(stop)
    @stop = Stop.new(stop)
    if @stop.save
      redirect resource(@stop), :message => {:notice => "Stop was successfully created"}
    else
      message[:error] = "Stop failed to be created"
      render :new
    end
  end

  def update(id, stop)
    @stop = Stop.get(id)
    raise NotFound unless @stop
    if @stop.update(stop)
       redirect resource(@stop)
    else
      display @stop, :edit
    end
  end

  def destroy(id)
    @stop = Stop.get(id)
    raise NotFound unless @stop
    if @stop.destroy
      redirect resource(:stops)
    else
      raise InternalServerError
    end
  end

end # Stops
