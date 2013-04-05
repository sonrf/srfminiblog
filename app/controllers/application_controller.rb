class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_admin
  before_filter :require_admin

  def current_admin
  	if session[:admin_id]
  		@current_admin ||= Admin.find(session[:admin_id])
  	else
  		nil
    end
  end
  private

  	def require_admin
  		unless current_admin
  			redirect_to new_session_path, alert: "Log In required to continue"
  		end
  	end
end
