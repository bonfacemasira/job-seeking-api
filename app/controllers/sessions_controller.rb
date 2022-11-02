class SessionsController < ApplicationController
    # skip_before_action :authorize, only: :create

       # Login action
       def login
        @user = User.find_by_email(user_params[:email]) 

      if @user && @user.authenticate(user_params[:password])
          token = encode_token({user_id: @user.id})
          render json: {user: @user, token: token}, status: :ok
      else
          render json: {error:"Invalid Email or password"}, status: :unauthorized
      end    
  end


    # def create
    #     user = User.find_by(email: params[:email]) # || Admin.find_by(email: params[:email])
    #     if user&.valid_password?(params[:password])
    #         session[:user_id] = user.id
    #         render json: user
    #     else
    #        render json: { error: ["Invalid email or password"] }, status: :unauthorized
    #     end
    # end

    # def destroy
    #     session.delete :user_id 
    #     head :no_content
    # end

    private

    def user_params
        params.permit(:email, :password)
    end

end
