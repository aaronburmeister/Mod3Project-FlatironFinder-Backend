class Framework < ApplicationRecord
  belongs_to :language
  has_many :user_frameworks
  has_many :users, through: :user_frameworks
end
