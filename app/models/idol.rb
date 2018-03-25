class Idol < ApplicationRecord
  mount_uploader :idol_image, IdolImageUploader
  validates :idol_name, presence: true, length: { maximum: 255 },
                        uniqueness: { case_sensitive: false }
  validates :idol_content,  length: { maximum: 1000 }
  validates :idol_url,length: { maximum: 255 }
  default_scope -> { order(idol_namekana: :ASC) }
  
  has_many :thoughts
  has_many :users, through: :thoughts
  has_many :likes
  has_many :think_likes, through: :likes, class_name: 'User', source: :user
  has_many :go_to_wents
  has_many :think_goes, through: :go_to_wents, class_name: 'User', source: :user
  has_many :thoughts, dependent: :delete_all
  

  scope :get_by_idol_name, ->(name) {
    where("idol_name like? or idol_namekana like?", "%#{sanitize_sql_like(name)}%", "%#{sanitize_sql_like(name)}%")
  }
  
  scope :get_by_name_a, ->(name_a){
    where("idol_namekana like 'あ%' or idol_namekana like 'い%' or idol_namekana like 'う%' or idol_namekana like 'え%'
 or idol_namekana like 'お%'")
  }
    scope :get_by_name_ka, ->(name_ka){
    where("idol_namekana like 'か%' or idol_namekana like 'が%' or idol_namekana like 'き%' or idol_namekana like 'ぎ%'
 or idol_namekana like 'く%' or idol_namekana like 'ぐ%' or idol_namekana like 'け%' or idol_namekana like 'げ%' or idol_namekana like 'こ%'
 or idol_namekana like 'ご%'")
  }
    scope :get_by_name_sa, ->(name_sa){
    where("idol_namekana like 'さ%' or idol_namekana like 'ざ%' or idol_namekana like 'し%' or idol_namekana like 'じ%'
 or idol_namekana like 'す%' or idol_namekana like 'ず%' or idol_namekana like 'せ%' or idol_namekana like 'ぜ%' or idol_namekana like 'そ%'
 or idol_namekana like 'ぞ%'")
  }
    scope :get_by_name_ta, ->(name_ta){
    where("idol_namekana like 'た%' or idol_namekana like 'だ%' or idol_namekana like 'ち%' or idol_namekana like 'ぢ%'
 or idol_namekana like 'つ%' or idol_namekana like 'づ%' or idol_namekana like 'て%' or idol_namekana like 'で%' or idol_namekana like 'と%'
 or idol_namekana like 'ど%'")
  }
    scope :get_by_name_na, ->(name_na){
    where("idol_namekana like 'な%' or idol_namekana like 'に%' or idol_namekana like 'ぬ%' or idol_namekana like 'ね%'
 or idol_namekana like 'の%'")
  }
    scope :get_by_name_ha, ->(name_ha){
    where("idol_namekana like 'は%' or idol_namekana like 'ば%' or idol_namekana like 'ぱ%' or idol_namekana like 'ひ%'
 or idol_namekana like 'び%' or idol_namekana like 'ぴ%' or idol_namekana like 'ふ%' or idol_namekana like 'ぶ%' or idol_namekana like 'ぷ%'
 or idol_namekana like 'へ%' or idol_namekana like 'べ%' or idol_namekana like 'ぺ%' or idol_namekana like 'ほ%' or idol_namekana like 'ぼ%'
 or idol_namekana like 'ぽ%'")
  }
    scope :get_by_name_ma, ->(name_ma){
    where("idol_namekana like 'ま%' or idol_namekana like 'み%' or idol_namekana like 'む%' or idol_namekana like 'め%'
 or idol_namekana like 'も%'")
  }
    scope :get_by_name_ya, ->(name_ya){
    where("idol_namekana like 'や%' or idol_namekana like 'ゐ%' or idol_namekana like 'ゆ%' or idol_namekana like 'ゑ%'
 or idol_namekana like 'よ%'")
  }
    scope :get_by_name_ra, ->(name_ra){
    where("idol_namekana like 'ら%' or idol_namekana like 'り%' or idol_namekana like 'る%' or idol_namekana like 'れ%'
 or idol_namekana like 'ろ%'")
  }
    scope :get_by_name_wa, ->(name_wa){
    where("idol_namekana like 'わ%' or idol_namekana like 'を%' or idol_namekana like 'ん%'")
  }
end
