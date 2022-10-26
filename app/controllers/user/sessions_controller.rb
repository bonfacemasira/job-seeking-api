class User::SessionsController < Devise::SessionsController
    def create
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user
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
