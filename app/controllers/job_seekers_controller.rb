class JobSeekersController < ApplicationController
  before_action :set_job_seeker, only: %i[ show update destroy ]

  # GET /job_seekers
  def index
    @job_seekers = JobSeeker.all

    render json: @job_seekers
  end

  # GET /job_seekers/1
  def show
    render json: @job_seeker
  end

  # POST /job_seekers
  def create
    @job_seeker = JobSeeker.new(job_seeker_params)

    if @job_seeker.save
      render json: @job_seeker, status: :created, location: @job_seeker
    else
      render json: @job_seeker.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /job_seekers/1
  def update
    if @job_seeker.update(job_seeker_params)
      render json: @job_seeker
    else
      render json: @job_seeker.errors, status: :unprocessable_entity
    end
  end

  # DELETE /job_seekers/1
  def destroy
    @job_seeker.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_seeker
      @job_seeker = JobSeeker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_seeker_params
      params.require(:job_seeker).permit(:user_id, :full_name, :salary_expectation, :certificates, :cv, :availability)
    end
end
