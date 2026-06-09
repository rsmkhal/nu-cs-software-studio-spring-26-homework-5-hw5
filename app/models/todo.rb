class Todo < ApplicationRecord
  CATEGORIES = [ "work", "study", "home chores", "personal" ].freeze

  validates :category, inclusion: { in: CATEGORIES }, allow_blank: true

  # Returns todos in the given category, or all todos when no category is given.
  scope :with_category, ->(category) {
    category.present? ? where(category: category) : all
  }
end
