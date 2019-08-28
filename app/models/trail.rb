class Trail < ApplicationRecord
  geocoded_by :location

  has_and_belongs_to_many :snacks
  belongs_to :user

  validates :name, presence: true
  validates :location, presence: true

  after_validation :geocode
end
