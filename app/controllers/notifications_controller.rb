class NotificationsController < ApplicationController
    def index
        @notifications = Notification.all
    end

    def create
        @notification = Notification.create(notification_params)
        render json: @notification, status: :created
    end

    def destroy
        @notification = Notification.find(params[:id])
        @notification.destroy
    end

    private

    def notification_params
        params.require(:notification).permit(:user_id, :status)
    end
end

