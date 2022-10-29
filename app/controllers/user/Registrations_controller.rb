class User::RegistrationsController < Devise::RegistrationsController
    wrap_parameters format: []
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
   
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
   
    #  protect_from_forgery with: :null_session

    def create
        user = User.create!(user_params)
       
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end
    


    private
   
    def user_params
        params.permit(:username, :role, :email, :password, :password_confirmation)
    end
    
    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
      end
      
end