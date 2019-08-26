class SnackRating < ApplicationRecord
  belongs_to :snack
  belongs_to :user

  validates :snack, presence: true
  validates :user, presence: true
  validates :stars, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than: 0}
end
