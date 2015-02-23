# app/controllers/heath_check_controller.rb
class HealthCheckController < ApplicationController
  def index
    render :text => "I am alive!\n"
  end

  protected
  def allow_http?
    true
  end
end
