class ApplicationController < ActionController::Base
  include TokenAuth::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  respond_to :json
  before_filter :set_format, except: [:app]
    
  def app
  end
  
  private
  def set_format
    request.format = "json"
  end
end
