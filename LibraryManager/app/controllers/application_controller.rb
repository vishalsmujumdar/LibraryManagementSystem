class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session	

  protected
 
	  def devise_parameter_sanitizer
	    if :sessions_controller?
	      super
	  	end
	    
	    if resource_class == User and :registrations_controller?
	      User::ParameterSanitizer.new(User, :user, params)
	    end
	  end


  
end
