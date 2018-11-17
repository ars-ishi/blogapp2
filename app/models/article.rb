class Article < ApplicationRecord
  belongs_to :user
  has_many :article_favorites, dependent: :destroy
  has_many   :favorite_users, through: :article_favorites, source: :user
  mount_uploader :main_image, ArticleMainImageUploader
  validates :title, presence: true
  validates :content, presence: true
  validates :main_image, presence: true
end
