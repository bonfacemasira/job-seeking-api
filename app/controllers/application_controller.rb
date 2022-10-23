class ApplicationController < ActionController::API
    before_action :configure_permitted_parameters, if: :devise_controller?
    respond_to :json
    protected
  
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation ) }
        devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit( :username, :email, :password, :remember_me) }

    end
end
