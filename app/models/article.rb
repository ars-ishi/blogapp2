class Article < ApplicationRecord
  belongs_to :user
  has_many :article_favorites, dependent: :destroy
  has_many :users, through: :article_favorites
  mount_uploader :main_image, ArticleMainImageUploader
  validates :title, presence: true
  validates :content, presence: true
  validates :main_image, presence: true
end
