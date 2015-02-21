class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]

	def create
		@user = User.new(user_params)
		
		if @user.save
			flash[:notice] = "Account Created Successfully!"
			session[:user_id] = @user.id
			redirect_to root_path
		else
			flash[:alert] = "There was a problem creating your account. Please try again."
			redirect_to :back
		end
	end

	def index
		@users = User.all
	end

	def edit
	end

	def show
	end

	# PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
   	new_params = user_params.delete_blanks!

  	respond_to do |format|
    if @user.update_attributes(new_params)
    	format.html { redirect_to edit_user_path(@user.id), notice: 'User was successfully updated.' }
      format.json { render :show, status: :ok, location: @user }
    else
      format.html { render :edit }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

private
	def set_user
    @user = User.find(params[:id])
  end

	def user_params
		params.require(:user).permit(:email, :name, :admin, :employee_id, :patient_record_access, :password, :password_confirmation)
	end
end