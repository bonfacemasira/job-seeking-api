class JobSeekerSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :salary_expectation, :certificates, :cv, :availability
  has_one :user
end
