class EmployerSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :phone_number, :organization
  has_one :user
end
