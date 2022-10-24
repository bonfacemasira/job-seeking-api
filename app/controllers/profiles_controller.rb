class ProfilesController < ApplicationController
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
