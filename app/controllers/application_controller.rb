class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit

  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?



  after_action :verify_authorized, :except => :index, unless: :pages_controller?
  after_action :verify_policy_scoped, :only => :index, unless: :pages_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized



  protected

  def pages_controller?
    :devise_controller? || params[:controller] == 'pages'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :profile_type
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

end
