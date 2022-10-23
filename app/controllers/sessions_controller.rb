class SessionsController < Devise::SessionsController
    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :created
        else
           render json: { error: ["Invalid username or password"] }, status: :unauthorized
        end
    end

    def destroy
        if session[:user_id] 
        session.destroy 
        head :no_content
    else
        render json: {errors: ["No user logged in"]}, status: :unauthorized
      end
    end
end
