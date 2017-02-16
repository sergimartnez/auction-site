class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def landing
  	@user = User.new
  	render "login"
  end

  def validate_user
  	@user = User.get_user params[:user][:email_address], params[:user][:password]
  	if @user
  		session[:current_user_id] = @user.id
  		session[:logged_in] = true
  		redirect_to "/users/#{@user.id}/products"
  	else
  		redirect_to "/"
  	end
  end
end
