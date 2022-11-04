class OfferSerializer < ActiveModel::Serializer
  attributes :id, :job_seeker_id, :employer_id, :image, :job_title
  has_one :employer
  has_one :job_seeker
  # has_one :user
end
