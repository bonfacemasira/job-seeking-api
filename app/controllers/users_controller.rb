class UsersController < ApplicationController
    before_action :authenticate_user!
    before_ction :admin_only, :except[:show]

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
    def update
        @user = User.find(params[:id])
        authorize @user
        if @user.update_attributes(secure_params)
          redirect_to users_path, :notice => "User updated."
        else
          redirect_to users_path, :alert => "Unable to update user."
        end
      end
    
      def destroy
        user = User.find(params[:id])
        authorize user
        user.destroy
        redirect_to users_path, :notice => "User deleted."
      end
    private
    def admin_only
        unless current_user.admin?
          redirect_to :back, :alert => "Access denied."
        end
end
