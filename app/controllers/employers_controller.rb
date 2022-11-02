class EmployersController < ApplicationController
  before_action :set_employer, only: %i[ show update destroy ]

  wrap_parameters format: []
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
   
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
      employer = Employer.create!(employer_params)
      render json: EmployerSerializer.new(employer).serializable_hash[:data][:attributes], status: :created
      
    end
    def index
      employer = Employer.all
      render json: employer
      
    end

    private

    def employer_params
      params.permit(:organization, :phone_number, :user_id, :image)
      
    end
    def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
end
    
end
