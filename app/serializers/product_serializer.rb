class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :rating, :price
  has_many :reviews
  has_one :inventory
end
