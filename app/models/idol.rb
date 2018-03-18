class Idol < ApplicationRecord
  validates :idol_name, presence: true, length: { maximum: 255 },
                        uniqueness: { case_sensitive: false }
  validates :idol_content, presence: true, length: { maximum: 255 }
  validates :idol_url, presence: true, length: { maximum: 255 }
  validates :idol_image, presence: true, length: { maximum: 255 }
end
