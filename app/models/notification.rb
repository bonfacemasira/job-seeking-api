class Notification < ApplicationRecord
    belongs_to :user

    validates :user_id, presence: true

    STATUSES = [:Pending, :Confirmed]

    scope :pending, -> { where(status: STATUSES[0]) }
    scope :confirmed, -> { where(status: STATUSES[1]) }
end