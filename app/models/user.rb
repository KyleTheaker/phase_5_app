class User < ApplicationRecord
    has_many :books
    has_many :likes
    has_many :comments
end
