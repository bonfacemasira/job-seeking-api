class JobSeekersController < ApplicationController
    wrap_parameters format: []
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
   
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    # include ActiveStorage::SetBlob, ActiveStorage::Streaming
    def create
        job_seeker = JobSeeker.create!(job_seeker_params)
        render json: JobSeekerSerializer.new(job_seeker).serializable_hash[:data][:attributes], status: :created
        
    end
    def update
        seeker = JobSeeker.find_by(id: params[:id])

        if seeker
            seeker.update(job_seeker_params)
            render json: JobSeekerSerializer.new(seeker).serializable_hash[:data]
        else
            render json: {error: "Job-seeker  not found"}, status: :not_found
        end
        
    end
    def index
        jobseeker = JobSeeker.all
        render json: JobSeekerSerializer.new(jobseeker).serializable_hash[:data]
        
    end
   
   
  

    private
  # removed user_id
    def job_seeker_params
     params.permit(:full_name, :country, :passport, :image, :job_type,:salary_expectation, :cv,:skills,  :availability,  :certificate, :experience)
        
    end
    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
    # def seeker_params
    #     params.permit(:full_name, :country, :passport, :image, :job_type, :salary_expectation, :cv,:skills, :availability,  :certificate, :experiences)
        
    # end
end
