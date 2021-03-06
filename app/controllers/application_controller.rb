class ApplicationController < ActionController::Base
	protect_from_forgery
	helper_method :current_user
	helper_method :message

	before_filter :set_current_user
	def set_current_user
		User.current_user = current_user
	end
	private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def message
		@message = Message.all
	end

end