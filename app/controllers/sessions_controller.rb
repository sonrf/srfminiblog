class SessionsController < ApplicationController
	skip_before_filter :require_admin, :only =>[:new, :create]
  def new
  end


  def create
  	if @admin = Admin.find_by_email(params[:admin][:email]).try(:authenticate,
  	params[:admin][:password])
  	session[:admin_id] = @admin.id
  	redirect_to posts_path
 	else
  	redirect_to new_session_path, alert:"Not recognized email or password"
  	end
  end
  def destroy
  	session.delete(:admin_id)
  	redirect_to posts_path, notice: "Have a nice day!"
  end
end
