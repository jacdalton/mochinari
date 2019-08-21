class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :trails
  has_many :snack_ratings
  has_many :snack_images
  has_many :snacks

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :username, presence: true
end
