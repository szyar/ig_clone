class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PostUploader
  validates :caption, length: { maximum: 2200 }
end
