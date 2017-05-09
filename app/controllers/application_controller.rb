class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to root_url
  end
 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :image, :dob, :gender])
 end

 # before_filter :set_current_user
 before_action :set_current_user


def set_current_user
  User.current_user = current_user
end

end
