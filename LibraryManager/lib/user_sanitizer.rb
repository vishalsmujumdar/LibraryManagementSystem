class User::ParameterSanitizer < Devise::ParameterSanitizer
	protected
		def sign_up
			default_params.permit(:name, :employee_id, :usertype, :email, :password, :password_confirmation)
		end
		def sign_in
			default_params.permit(:email, :password, :remember_me)
		end
end