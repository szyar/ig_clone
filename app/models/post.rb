class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  mount_uploader :picture, PostUploader
  validates :caption, presence: true, length: { maximum: 2200 }
end
