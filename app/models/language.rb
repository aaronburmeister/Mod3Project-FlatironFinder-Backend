class Language < ApplicationRecord
    has_many :users, through: :user_languages
    has_many :frameworks
end
