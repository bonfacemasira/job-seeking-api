class JobSeekersController < ApplicationController
    wrap_parameters format: []
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
   
    # include ActiveStorage::SetBlob, ActiveStorage::Streaming
    def create
        job_seeker = JobSeeker.create!(job_seeker_params)
        render json: job_seeker
        # render json: JobSeekerSerializer.new(job_seeker).serializable_hash[:data][:attributes], status: :created
        
    end
    
    def update
        seeker = JobSeeker.find_by(id: params[:id])
        seeker.update!(job_seeker_params)
        render json: seeker 
    end

    def index
        jobseeker = JobSeeker.all
        render json: jobseeker

    end
   
    def myOffers
        offers = Offer.where("job_seeker_id=?", params[:id])
        render json: offers
      end
  

    private
  # removed user_id
    def job_seeker_params
     params.permit(:full_name, :country, :passport, :image, :job_type,:salary_expectation, :cv,:skills,  :availability,  :certificate, :experience)
        
    end

    def render_not_found_response
        render json: { error: "user not found" }, status: :not_found
    end
end
