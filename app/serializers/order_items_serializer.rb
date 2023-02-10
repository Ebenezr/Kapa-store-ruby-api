class OrderItemsSerializer < ActiveModel::Serializer
  attributes :id, :order_id, :product_id
  has_many :product
  has_many :orders
end
