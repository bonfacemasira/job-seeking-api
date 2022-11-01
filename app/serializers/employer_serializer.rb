class EmployerSerializer < ActiveModel::Serializer
  attributes :id,  :phone_number, :organization, :user_id, :image
  has_one :user
end
