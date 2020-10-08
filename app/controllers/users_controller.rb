class UsersController < ApplicationController
	before_action :check_login, only: :new
	 def show
	 	@user = User.find_by id: params[:id]
 		if @user.nil?
 			flash[:danger] = "user not found"
 			redirect_to root_url
 		end
	 end
	 private 
	 def check_login
	 	if user_signed_in? 
	 		flash[:danger] = "you are logging"
	 		redirect_to root_url
	 	end	
	end 
	
end
