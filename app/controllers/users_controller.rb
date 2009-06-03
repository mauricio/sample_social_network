class UsersController < ApplicationController  

  before_filter :login_required, :only => [ :update, :edit ]

  def index
    @users = paginate_model( User )
  end

  def show
    @user = User.find( params[:id] )
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update_attributes(params[:user])
      respond_to do |format|
        format.html do
          flash[:notice] = 'Your profile was successfully updated'
          redirect_to user_path(current_user)
        end
      end
    else
      respond_to do |format|
        format.html do
          render :edit
        end
      end
    end
  end

  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    if @user.save
      self.current_user = @user # !! now logged in
      flash[:notice] = "Welcome to the Sample Social Network!"
      redirect_back_or_default( user_path(@user) )
    else
      flash.now[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
  
end
