class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :telephone
  has_many :orders
end
