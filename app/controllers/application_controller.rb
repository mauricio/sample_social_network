# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  include AuthenticatedSystem

  before_filter :set_current_locale

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  protected

  def load_page
    @page = params[:page].blank? ? '1' : params[:page]
    @per_page = params[:per_page].blank? ? '15' : params[:per_page]
  end

  def set_current_locale
    session[:locale] = params[:locale] || session[:locale]
    I18n.locale=( session[:locale] )
  end

  def paginate_model( model, options = {})
    load_page
    model.paginate( { :per_page => @per_page, :page => @page }.merge( options ) )
  end
end
