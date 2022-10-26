class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :amount, :payment_id
  has_one :employer
end
