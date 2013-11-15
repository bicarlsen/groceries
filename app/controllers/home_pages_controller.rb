class HomePagesController < ApplicationController
	def home
		if signed_in?
			@user = current_user
			render 'users/home'
		else
			@user = User.new
		end
	end

end
