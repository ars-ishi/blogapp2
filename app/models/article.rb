class Article < ApplicationRecord
  belongs_to :user
  mount_uploader :main_image, ArticleMainImageUploader
  validates :title, presence: true
  validates :content, presence: true
  validates :main_image, presence: true
end
