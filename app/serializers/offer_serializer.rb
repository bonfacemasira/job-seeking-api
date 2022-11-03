class OfferSerializer < ActiveModel::Serializer
  attributes :id,  :employer_id, :job_seeker_id,  :user_id, :image, :name, :job_title
  has_one :employer
  has_one :job_seeker
  has_one :user
end
