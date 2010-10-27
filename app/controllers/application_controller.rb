class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  
  before_filter :set_timezone

  def set_timezone
    Time.zone = "Singapore"
  end
  
  def after_sign_in_path_for(resource)
    budgets_url
  end
  
end
