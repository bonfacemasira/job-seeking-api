class Profile < ApplicationRecord
   
    has_one_attached :profile_picture

    belongs_to :job_seeker
    belongs_to :employer
    belongs_to :user
end
