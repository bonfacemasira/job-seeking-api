class UsersController < ApplicationController
  skip_before_action :authorize, only: :create
  wrap_parameters format: []
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    render json: user, status: :created
  end

  def show
    render json: @current_user
  end

  def index
    users = User.all
    render json: users
  end

    # def loggedIn
    #   user = User.find_by(id: session[:user_id])
    #   if user
    #     render json: user, status: :found
    #   else
    #     render json: { error: "Not authorized" }, status: :unauthorized
    #   end
    # end

    # def update
    #     @user = User.find(params[:id])
    #     authorize @user
    #     if @user.update_attributes(secure_params)
    #       redirect_to users_path, :notice => "User updated."
    #     else
    #       redirect_to users_path, :alert => "Unable to update user."
    #     end
    #   end
    
    #   def destroy
    #     user = User.find(params[:id])
    #     authorize user
    #     user.destroy
    #     redirect_to users_path, :notice => "User deleted."
    #   end
    # private
    # def admin_only
    #     unless current_user.admin?
    #       redirect_to :back, :alert => "Access denied."
      
    #     end
    #   end

  private
   
  def user_params
    params.permit(:username, :role, :email, :password, :password_confirmation)
  end

end
