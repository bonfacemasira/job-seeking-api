class JobSeekersController < ApplicationController
    wrap_parameters format: []
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
   
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def create
        job_seeker = JobSeeker.create!(job_seeker_params)
        render json: job_seeker, status: :created
        
    end
    def update
        seeker = JobSeeker.find_by(id: params[:id])

        if seeker
            seeker.update(seeker_params)
            render json: seeker
        else
            render json: {error: "Job-seeker  not found"}, status: :not_found
        end
        
    end
   
   
  

    private

    def job_seeker_params
        params.permit(:full_name, :salary_expectation, :cv,:skills, :user_id, :availability,  certificates: [], experience: [], :country, :passport, :image, :job_type)
        
    end
    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
      end
      def seeker_params
        params.permit(:full_name, :salary_expectation, :cv,:skills, :user_id, :availability,  certificates: [], experience: [], :country, :passport, :image, :job_type)
        
    end
end
