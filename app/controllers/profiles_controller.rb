class ProfilesController < ApplicationController

    # for trial 
    # def index
    #     user = Profile.all
    #     render json: user
    # end

    # def show
    #     user = Profile.find_by(id: session[:user_id])
    #     if user
    #       render json: user
    #     else
    #       render json: { error: "Not authorized" }, status: :unauthorized
    #     end
    # end

    def update
        profile = Profile.find_by(id: params[:id])

        if profile
            profile.update(profile_params)
            render json: profile
        else
            render json: {error: "Profile not found"}, status: :not_found
        end
        
    end

  
   
    
    private
    def profile_params
        params.permit(:profile_picture, :email, :full_name, :phone_number, :bio, :user_id, :employer_id, :job_seeker_id)
        
    end
end
