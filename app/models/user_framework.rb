class UserFramework < ApplicationRecord
  belongs_to :user
  belongs_to :framework

  validate :has_language
    private def has_language
      if !user.languages.includes(framework.language)
        errors.add(:framework, "Cannot add framework without associated language")
      end
    end
end
