class Idol < ApplicationRecord
  mount_uploader :idol_image, IdolImageUploader
  validates :idol_name, presence: true, length: { maximum: 255 },
                        uniqueness: { case_sensitive: false }
  validates :idol_content, presence: true, length: { maximum: 1000 }
  validates :idol_url, presence: true, length: { maximum: 255 }
  
  has_many :thoughts
  has_many :users, through: :thoughts
  has_many :likes
  has_many :think_likes, through: :likes, class_name: 'User', source: :user
  has_many :go_to_wents
  has_many :think_goes, through: :go_to_wents, class_name: 'User', source: :user
  has_many :thoughts, dependent: :destroy
end
