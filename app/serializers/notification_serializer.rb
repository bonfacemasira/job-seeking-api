class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :status, :user_id, :null, :false, :default, :Pending
end
