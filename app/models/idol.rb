class Idol < ApplicationRecord
  mount_uploader :idol_image, IdolImageUploader
  validates :idol_name, presence: true, length: { maximum: 255 },
                        uniqueness: { case_sensitive: false }
  validates :idol_content, presence: true, length: { maximum: 1000 }
  validates :idol_url, presence: true, length: { maximum: 255 }
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
    where("idol_namekana REGEXP '^(あ|い|う|え|お)+'", (name_a))
  }
    scope :get_by_name_ka, ->(name_ka){
    where("idol_namekana REGEXP '^(か|が|き|ぎ|く|ぐ|け|げ|こ|ご)+'", (name_ka))
  }
    scope :get_by_name_sa, ->(name_sa){
    where("idol_namekana REGEXP '^(さ|ざ|し|じ|す|ず|せ|ぜ|そ|ぞ)+'", (name_sa))
  }
    scope :get_by_name_ta, ->(name_ta){
    where("idol_namekana REGEXP '^(た|だ|ち|ぢ|つ|づ|て|で|と|ど)+'", (name_ta))
  }
    scope :get_by_name_na, ->(name_na){
    where("idol_namekana REGEXP '^(な|に|ぬ|ね|の)+'", (name_na))
  }
    scope :get_by_name_ha, ->(name_ha){
    where("idol_namekana REGEXP '^(は|ば|ぱ|ひ|び|ぴ|ふ|ぶ|ぷ|へ|べ|ぺ|ほ|ぼ|ぽ)+'", (name_ha))
  }
    scope :get_by_name_ma, ->(name_ma){
    where("idol_namekana REGEXP '^(ま|み|む|め|も)+'", (name_ma))
  }
    scope :get_by_name_ya, ->(name_ya){
    where("idol_namekana REGEXP '^(や|ゐ|ゆ|ゑ|よ)+'", (name_ya))
  }
    scope :get_by_name_ra, ->(name_ra){
    where("idol_namekana REGEXP '^(ら|り|る|れ|ろ)+'", (name_ra))
  }
    scope :get_by_name_wa, ->(name_wa){
    where("idol_namekana REGEXP '^(わ|を|ん)+'", (name_wa))
  }
end
