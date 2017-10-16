class AdminsController < ApplicationController
@@search_users = {}
	def dash
		verifyAdmin
		@companies = User.pluck('DISTINCT company')
		@companies.sort_by!{ |e| e.downcase }
		@users = User.all.paginate(:page => params[:page])
	end
	def users
		verifyAdmin
		@user = User.find(params['id'])
	end
	def verifyAdmin
		if session[:user_id]
			@user = User.find(session[:user_id])
			if @user && @user.permod
			else
				redirect_to "/" and return
			end
		else
			redirect_to "/" and return
		end
	end
	def users_search
		verifyAdmin
		@@search_users = User.where("email LIKE ? OR first LIKE ? OR last LIKE ? OR company LIKE ?", "%#{params['search']}%","%#{params['search']}%","%#{params['search']}%","%#{params['search']}%")
		redirect_to '/admins/users_found'
	end
	def users_found
		verifyAdmin
		if @@search_users.length > 0
			@users = @@search_users.paginate(:page => params[:page])
		else
			redirect_to "/admin_dash" and return
		end
	end
	def delete_user
		verifyAdmin
		User.find(params['id']).destroy
		redirect_to "/admin_dash"
	end
end
