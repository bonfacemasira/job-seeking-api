class EmployerSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :phone_number, :organization
  has_one :user
end
