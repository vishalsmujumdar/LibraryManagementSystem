class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new

		if user.usertype == "ADMIN"
			can :manage, :all
		else
			can :read, :all
			can :ajaxsearchbooks, Book
		end
	end

end