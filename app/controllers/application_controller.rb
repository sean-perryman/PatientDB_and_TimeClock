class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_has_patient_record_access
  	redirect_to root_path if !current_user.patient_record_access
  end

  def user_signed_in?
		if session[:user_id]
			true
		else
			false
		end
	end

	def current_user
		@current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
	end

	helper_method :current_user
	helper_method :user_signed_in?
end
