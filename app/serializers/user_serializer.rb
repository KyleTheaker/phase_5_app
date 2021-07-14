class UserSerializer < ActiveModel::Serializer
  has_many :books
  has_many :comments
  has_many :likes
  
  attributes :id, :username, :password_digest
end
