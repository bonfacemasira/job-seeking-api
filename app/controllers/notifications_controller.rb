class NotificationsController < ApplicationController
    def index
        @notifications = Notification.where(user: current_user).unread
    end

    def create
        @notification = Notification.new(notification_params)
        @notification.sender = current_user
        @notification.save
        redirect_to notifications_path
    end
    
    def mark_as_read
        @notifications = Notification.where(user: current_user).unread
        @notifications.update_all(read_at: Time.zone.now)
        redirect_to notifications_path
    end

    def destroy
        @notification = Notification.find(params[:id])
        @notification.destroy
        redirect_to notifications_path
    end

    private

    def notification_params
        params.require(:notification).permit(:user_id, :status)
    end
end

