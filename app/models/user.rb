class User < ApplicationRecord
    has_many :frameworks, through: :user_frameworks
    has_many :languages, through: :user_languages

    has_secure_password

    validates :username, presence: true
    validates :password, presence: true
end
