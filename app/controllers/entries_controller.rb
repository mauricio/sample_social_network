
class EntriesController < ApplicationController

  before_filter :login_required, :only => [ :new, :edit, :create, :update, :destroy ]

  def index
    options = { :include => :user }
    options[:conditions] = { :user_id => params[:user_id] } unless params[:user_id].blank?
    @entries = paginate_model( Entry, options )
  end

  def show
    @entry = Entry.find( params[:id] )
  end

  def new
    @entry = current_user.entries.new
  end

  def create
    create_or_update( 'created', :new )
  end

  def edit
    @entry = current_user.entries.find( params[:id] )
  end

  def update
    create_or_update( 'updated', :edit )
  end

  protected

  def create_or_update( message, error_action )
    @entry = params[:id] ? current_user.entries.find( params[:id] ) : current_user.entries.build
    if @entry.update_attributes( params[:entry] )
      respond_to do |format|
        format.html do
          flash[:notice] = "Your entry was successfully #{message}"
          redirect_to entry_path( @entry )
        end
      end
    else
      respond_to do |format|
        format.html { render error_action }
      end
    end
  end
  
end