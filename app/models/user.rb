class User < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :orders, dependent: :destroy
    has_many :addresses, dependent: :destroy
    has_many :user_payments, dependent: :destroy
end
