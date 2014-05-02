class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :configure_permitted_parameters, if: :devise_controller?


  protected
 
	  # def devise_parameter_sanitizer
	  #   if :sessions_controller?
	  #     super
	  # 	end
	    
	  #   if resource_class == User  and :registrations_controller?
	  #     User::ParameterSanitizer.new(User, :user, params)
	  #   end
	  # end

	def configure_permitted_parameters
	   devise_parameter_sanitizer.for(:sign_up) << [:name, :employee_id, :usertype]
	end
  
end
