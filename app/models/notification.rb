class Notification < ApplicationRecord
    belongs_to :user

    validates :user_id, presence: true

    STATUSES = [:Pending, :Confirmed]
end
