class Category < ApplicationRecord
  has_many :products, dependet: :destroy
end
