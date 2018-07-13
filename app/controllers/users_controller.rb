class UsersController < ApplicationController
	# skip_before_action :verify_authenticity_token
	def import
		User.import(params[:file])
		redirect_to root_url, notice: "Data Imported"
	end
	def new
	end
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "User Saved!"
		else
			flash[:errors] = @user.errors.full_messages
		end
		redirect_back(fallback_location: root_url)
	end
	def user_params
		params.require(:user).permit(:entry, :created, :updated, :ip, :profile_type, :first, :last, :dob, :email, :title, :dept, :company, :company_address, :company_address_two, :company_city, :company_state, :company_zip, :company_country, :company_email, :office_phone, :office_fax, :office_contact, :home_address, :home_address_two, :home_city, :home_state, :home_zip, :home_country, :home_phone, :cell_phone, :emergency_first, :emergency_last, :emergency_phone, :emergency_relationship, :airline_1, :frequent_1, :airline_2, :frequent_2, :airline_3, :frequent_3, :airline_4, :frequent_4, :seating_preference, :special_meal, :hotel_1, :guest_1, :hotel_2, :guest_2, :hotel_3, :guest_3, :hotel_4, :guest_4, :rental_1, :type_1, :club_1, :discount_1, :rental_2, :type_2, :club_2, :discount_2, :rental_3, :type_3, :club_3, :discount_3, :additional_info, :smoking, :password, :password_confirmation, :middle, :tsa)
	end
	def show
		if session[:user_id]
			@user = User.find(session[:user_id])
			if @user.permod
				@user = User.find(params['id'])
			else
			end
		else
			flash[:login_errors] = "Please login"
			redirect_to "/" and return
		end
	end
	def update
		@user = User.find(params[:id])
		@admin = User.find(session[:user_id])
		if @admin.permod
			@user.update(user_params)
			@user.save(validate:false)
			flash[:success] = "Profile Updated Successfully!"
			redirect_to "/admins/users/#{@user.id}" and return
		else
			@user.update(user_params)
		end
		flash[:success] = "Profile Updated Successfully!"
		redirect_to "/users/#{@user.id}" and return
	end
	def recover
		@user = User.find_by(email: params['email'].downcase)
		if !@user
			flash[:login_errors] = "Email not found"
		else
			random_password = Array.new(6).map { rand(10).to_s }.join
			@user.password = random_password
			@user.password_confirmation = random_password
			@user.save!
			UserMailer.create_and_deliver_password_change(@user, random_password).deliver_now
			flash[:success] = "Email sent"
		end
		redirect_to "/"
	end
end
