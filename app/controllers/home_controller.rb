class HomeController < ApplicationController
	def index
		if logged_in?
#			redirect_to boards_path
			redirect_to boards_url
#		else
#			redirect_to login_path
		end
	end
end
