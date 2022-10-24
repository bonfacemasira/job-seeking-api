class Profile < ApplicationRecord
    belongs_to :job_seeker
    belongs_to :employer
    belongs_to :user
end
