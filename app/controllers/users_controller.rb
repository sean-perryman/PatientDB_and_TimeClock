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
	end

	def edit
	end

	def show
		@user = User.find(params[:id])
	end

	# PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
    if @user.update(user_params)
      format.html { redirect_to @user, notice: 'User was successfully updated.' }
      format.json { render :show, status: :ok, location: @user }
    else
      format.html { render :edit }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
  
end

private
	def user_params
		params.require(:user).permit(:email, :name, :employee_id, :password, :password_confirmation)
	end
end