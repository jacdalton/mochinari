class SnackRating < ApplicationRecord
  belongs_to :snack
  belongs_to :user

  validates :snack, presence: true
  validates :user, presence: true
  validates :stars, presence: true, numericality: { only_integer: true }, length: { in: 1..5 }
end
