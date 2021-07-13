class CommentSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :book
  attributes :id, :title, :body
end
