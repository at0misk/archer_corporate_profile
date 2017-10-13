class AdminsController < ApplicationController
	def dash
		@companies = User.pluck('DISTINCT company')
		@companies.sort_by!{ |e| e.downcase }
	end
end
