class EmployersController < ApplicationController
    def create
        employer = Employer.create!(employer_params)
        render json: employer, status: :created
        
    end

    def employer_params
        params.permit(:organization, :user_id)
        
    end
    private
    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
      end
end
