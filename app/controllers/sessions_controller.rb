class SessionsController < ApplicationController

	def new

	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		logger.debug "CBBB debug, the user is: #{user.name}"
		if user #&& user.authenticate(params[:session][:password])
			sign_in(user) 
			redirect_to user
		else
			flash.now[:error] = "Invalid Sign-in Son"
			render 'new'
		end

	end

	def destroy
		sign_out
		redirect_to root_path 
	end 

end
