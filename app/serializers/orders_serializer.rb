class OrdersSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :user_payment
end
