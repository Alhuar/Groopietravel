class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  unless Rails.env.development?
  	protect_from_forgery with: :exception
  end
  
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def index
  end
protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) << :name
	end

  def after_sign_in_path_for(resource)
    user_path(current_user) 
  end

  def disable_nav
    @disable_nav = true
  end

end
