class User < ApplicationRecord
    has_many :user_frameworks
    has_many :frameworks, through: :user_frameworks
    has_many :user_languages
    has_many :languages, through: :user_languages

    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 8 }, on: :create
    validates :password, length: { minimum: 8 }, on: :update, unless: Proc.new { |a| a.password.blank? }
    validates :name, presence: true
    validates :email, presence: true
    validates :campus, presence: true
end
