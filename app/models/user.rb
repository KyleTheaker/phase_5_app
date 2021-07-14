class User < ApplicationRecord
    has_many :books
    has_many :likes
    has_many :comments

    has_secure_password

    validates :username, presence: true, uniqueness: { case_sensitive: true }

    validates :password, length: { minimum: 3, maximum: 20 }, allow_nil: true

end
