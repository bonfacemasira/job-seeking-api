class Employer < ApplicationRecord
  validates :organization, presence: true
  belongs_to :user
end
