class ApplicationController < ActionController::Base
  def self.force_ssl(options = {})
    host = options.delete(:host)
    before_filter(options) do
      if !request.ssl? && !Rails.env.development? && !(respond_to?(:allow_http?) && allow_http?)
        redirect_options = {:protocol => 'https://', :status => :moved_permanently}
        redirect_options.merge!(:host => host) if host
        redirect_options.merge!(:params => request.query_parameters)
        redirect_to redirect_options
      end
    end
  end


  force_ssl

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

	def timeclock_id
		if current_user.employee_id.nil?
			current_user.id
		else
			current_user.employee_id
		end
	end

	helper_method :current_user
	helper_method :user_signed_in?
	helper_method :timeclock_id
end
