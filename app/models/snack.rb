class Snack < ApplicationRecord
  include PgSearch::Model

  acts_as_taggable_on :tags
  acts_as_favoritable
  geocoded_by :shop_location

  belongs_to :category
  belongs_to :user
  has_and_belongs_to_many :trails
  has_many :snack_images
  has_many :snack_ratings

  validates :name, presence: true, uniqueness: { scope: :shop_location }
  validates :description, presence: true, length: { minimum: 20 }
  validates :shop_location, presence: true
  validates :category, presence: true

  after_validation :geocode, if: :will_save_change_to_shop_location?

  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
  using: {
    tsearch: { prefix: true, any_word: true }
  }

  pg_search_scope :tag_search,
  associated_against: {
    tags: [:name]
  },
  using: {
    tsearch: { prefix: true, any_word: true }
  }

  def avg_snack_stars
    return 0 if snack_ratings.empty?
    snack_stars_array = snack_ratings.map(&:stars)
    avg_stars_float = snack_stars_array.inject { |sum, el| sum + el }.to_f / snack_stars_array.size
    avg_stars_float.round(half: :up)
  end
end
