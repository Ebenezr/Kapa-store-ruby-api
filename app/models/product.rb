class Product < ApplicationRecord
  belongs_to :inventory
  belongs_to :discount
  belongs_to :category
  has_many :reviews, dependet: :destroy
end
