class LikeSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :book
  attributes :id
end
