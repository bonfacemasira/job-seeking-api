class Employer < ApplicationRecord
    validates :organization, presence: true
end
