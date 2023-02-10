class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :description
  has_one :product
  has_one :user
end
