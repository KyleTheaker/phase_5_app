class BookSerializer < ActiveModel::Serializer
  has_many :users
  has_many :comments
  has_many :likes
  
  attributes :id, :title, :author
end
