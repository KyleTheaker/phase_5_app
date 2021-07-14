class Book < ApplicationRecord
has_many :users
has_many :likes
has_many :comments
end
