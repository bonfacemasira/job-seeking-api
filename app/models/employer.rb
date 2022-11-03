class Employer < ApplicationRecord
  validates :organization, presence: true
  belongs_to :user
  has_one_attached :image
  
  has_many :offers
  has_many :job_seekers, through: :offers

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
