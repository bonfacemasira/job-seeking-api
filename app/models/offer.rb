class Offer < ApplicationRecord
  belongs_to :employer
  belongs_to :job_seeker
  belongs_to :user

end
