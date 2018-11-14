class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, dependent: :destroy
  enum role: { admin: 0, member: 1 }
  mount_uploader :ic_image, UserIcImageUploader
  mount_uploader :bg_image, UserBgImageUploader
end
