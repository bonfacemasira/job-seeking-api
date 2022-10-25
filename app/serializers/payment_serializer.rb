class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :aomunt, :employer_id, :payment_id
  has_one :employer
end
