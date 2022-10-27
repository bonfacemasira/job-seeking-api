class OfferSerializer < ActiveModel::Serializer
  attributes :id, :profile_picture, :employer_id, :job_seeker_id, :full_name, :email, :user_id, :phone_number, :bio
  has_one :employer
  has_one :job_seeker
  has_one :user
end
