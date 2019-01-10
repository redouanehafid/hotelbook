class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :footer
	
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :logo)}
  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :logo, :nom, :ville, :siteweb, :facebook )}
  end

  def footer
		@clients = Post.where(category_id: 1).order("created_at DESC").limit(5)
		@fournisseurs = Post.where(category_id: 2).order("created_at DESC").limit(5)
		@autres = Post.where(category_id: 3).order("created_at DESC").limit(5)
	end

end






