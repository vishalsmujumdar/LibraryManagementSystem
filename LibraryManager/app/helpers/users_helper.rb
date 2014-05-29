module UsersHelper
	def add_new_user(parameters)
	  generated_password = Devise.friendly_token.first(8)
	  parameters.merge!(:password => generated_password, :usertype => "USER")
	  user = User.create!(parameters)

	  UserMailer.registration_confirmation(user).deliver

	  return user
	end
end
