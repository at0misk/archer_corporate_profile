class SessionsController < ApplicationController
	def root
	end
	def import
	end
	def new
		@user = User.find_by(email: params['email'])
		if @user
			if @user.authenticate(params['password'])
				session[:user_id] = @user.id
				if @user.permod
					redirect_to "/admin_dash" and return
				else
					redirect_to "/users/#{@user.id}" and return
				end
			else
				flash[:login_errors] = "Incorrect Password"
			end
		else
			flash[:login_errors] = "User not found"
		end
		redirect_to "/"
	end
end
