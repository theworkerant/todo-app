class ApplicationController < ActionController::Base
  include TokenAuth::Controller
  
  respond_to :json
  before_filter :set_format, except: [:app]
    
  def app
  end
  
  private
  def set_format
    request.format = "json"
  end
end
