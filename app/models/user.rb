class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_favoritor
  geocoded_by :location
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  has_many :trails, dependent: :destroy
  has_many :snack_ratings, dependent: :destroy
  has_many :rated_snacks, through: :snack_ratings, source: :snack
  has_many :snack_images, dependent: :destroy
  has_many :snacks

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :username, presence: true
end
