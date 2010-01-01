class Users < Application

  def index
    render
  end

  def home
    if session.user
      @user = session.user
      render :show
    else
      @trip = Trip.new
      render :template => "trips/new"
    end
  end

  def show(id)
    @user = User.get(id)
    raise NotFound unless @user
    render
  end

  def edit(id)
    @user = User.get(id)
    raise NotFound unless @user
    render
  end

  def update(id, user)
    @user = User.get(id)
    raise NotFound unless @user
    if @user.update(user)
      redirect resource(@user), :message => {:success => "Account updated"}
    else
      display @user, :edit
    end
  end
  
end
