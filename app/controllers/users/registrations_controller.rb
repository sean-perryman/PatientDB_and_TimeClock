# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name, :employee_id)
    devise_parameter_sanitizer.for(:update).push(:name, :employee_id)
  end
end

# config/routes.rb
devise_for :users, :controllers => { :registrations => "users/registrations" }