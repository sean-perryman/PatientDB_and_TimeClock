class UsersController < ApplicationController
	def create
		@user = User.new(user_params)
		
		if @user.save
		flash[:notice] = "Account Created Successfully!"
		redirect_to "/"
	else
		flash[:alert] = "There was a problem creating your account. Please try again."
		redirect_to :back
	end

	def edit

	end

	def show

	end
end

private
	def user_params
		params.require(:user).permit(:email, :name, :employee_id, :password, :password_confirmation)
	end
end