class ApplicationController < ActionController::API
    include ActionController::Cookies
    # protect_from_forgery with: :null_session

    # protect_from_forgery prepend: true
    # skip_before_action :verify_authenticity_token, :only => :create

    

    before_action :configure_permitted_parameters, if: :devise_controller?
    respond_to :json
    
   
    
    
    protected
  
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :encrypted_password, :password_confirmation ) }
        devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit( :username, :email, :encrypted_password) }

    end

end