class UsersController < ApplicationController
    before_action :authenticate_user!, only:[:show]

    def show
        user = User.find_by(id: session[:user_id])
        if user
          render json: user
        else
          render json: { error: "Not authorized" }, status: :unauthorized
        end
      
    end
    def index
        user = User.all
        render json: user
    end
end
