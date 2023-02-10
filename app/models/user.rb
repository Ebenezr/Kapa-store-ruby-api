class User < ApplicationRecord
    has_many :reviews, dependet: :destroy
    has_many :orders, dependet: :destroy
    has_many :addresses, dependet: :destroy
    has_many :user_payments, dependet: :destroy
end
