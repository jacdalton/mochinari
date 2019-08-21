class Trail < ApplicationRecord
  has_and_belongs_to_many :snacks
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true
  validates :location, presence: true
end
