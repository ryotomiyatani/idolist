class Idol < ApplicationRecord
  mount_uploader :idol_image, IdolImageUploader
  validates :idol_name, presence: true, length: { maximum: 255 },
                        uniqueness: { case_sensitive: false }
  validates :idol_content,  length: { maximum: 2000 }
  validates :idol_url,length: { maximum: 255 }

  
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
    where("idol_namekana like 'あ%' or idol_namekana like 'ア%' 
        or idol_namekana like 'い%' or idol_namekana like 'イ%'  
        or idol_namekana like 'う%' or idol_namekana like 'ウ%'
        or idol_namekana like 'え%' or idol_namekana like 'エ%' 
        or idol_namekana like 'お%' or idol_namekana like 'オ%'")
  }
    scope :get_by_name_ka, ->(name_ka){
    where("idol_namekana like 'か%' or idol_namekana like 'カ%' or idol_namekana like 'が%' or idol_namekana like 'ガ%' 
        or idol_namekana like 'き%' or idol_namekana like 'キ%' or idol_namekana like 'ぎ%' or idol_namekana like 'ギ%' 
        or idol_namekana like 'く%' or idol_namekana like 'ク%' or idol_namekana like 'ぐ%' or idol_namekana like 'グ%' 
        or idol_namekana like 'け%' or idol_namekana like 'ケ%' or idol_namekana like 'げ%' or idol_namekana like 'ゲ%' 
        or idol_namekana like 'こ%' or idol_namekana like 'コ%' or idol_namekana like 'ご%' or idol_namekana like 'ゴ%'")
  }
    scope :get_by_name_sa, ->(name_sa){
    where("idol_namekana like 'さ%' or idol_namekana like 'サ%' or idol_namekana like 'ざ%' or idol_namekana like 'ザ%' 
        or idol_namekana like 'し%' or idol_namekana like 'シ%' or idol_namekana like 'じ%' or idol_namekana like 'ジ%'
        or idol_namekana like 'す%' or idol_namekana like 'ス%' or idol_namekana like 'ず%' or idol_namekana like 'ズ%' 
        or idol_namekana like 'せ%' or idol_namekana like 'セ%' or idol_namekana like 'ぜ%' or idol_namekana like 'ゼ%' 
        or idol_namekana like 'そ%' or idol_namekana like 'ソ%' or idol_namekana like 'ぞ%' or idol_namekana like 'ゾ%'")
  }
    scope :get_by_name_ta, ->(name_ta){
    where("idol_namekana like 'た%' or idol_namekana like 'タ%' or idol_namekana like 'だ%' or idol_namekana like 'ダ%'
        or idol_namekana like 'ち%' or idol_namekana like 'チ%' or idol_namekana like 'ぢ%' or idol_namekana like 'ヂ%' 
        or idol_namekana like 'つ%' or idol_namekana like 'ツ%' or idol_namekana like 'づ%' or idol_namekana like 'ヅ%' 
        or idol_namekana like 'て%' or idol_namekana like 'テ%' or idol_namekana like 'で%' or idol_namekana like 'デ%'
        or idol_namekana like 'と%' or idol_namekana like 'ト%' or idol_namekana like 'ど%' or idol_namekana like 'ド%'")
  }
    scope :get_by_name_na, ->(name_na){
    where("idol_namekana like 'な%' or idol_namekana like 'ナ%' 
        or idol_namekana like 'に%' or idol_namekana like 'ニ%'
        or idol_namekana like 'ぬ%' or idol_namekana like 'ヌ%' 
        or idol_namekana like 'ね%' or idol_namekana like 'ネ%' 
        or idol_namekana like 'の%' or idol_namekana like 'ノ%'")
  }
    scope :get_by_name_ha, ->(name_ha){
    where("idol_namekana like 'は%' or idol_namekana like 'ハ%' or idol_namekana like 'ば%' or idol_namekana like 'バ%' or idol_namekana like 'ぱ%' or idol_namekana like 'パ%'
        or idol_namekana like 'ひ%' or idol_namekana like 'ヒ%' or idol_namekana like 'び%' or idol_namekana like 'ビ%' or idol_namekana like 'ぴ%' or idol_namekana like 'ピ%'
        or idol_namekana like 'ふ%' or idol_namekana like 'フ%' or idol_namekana like 'ブ%' or idol_namekana like 'ブ%' or idol_namekana like 'ぷ%' or idol_namekana like 'プ%'
        or idol_namekana like 'へ%' or idol_namekana like 'ヘ%' or idol_namekana like 'べ%' or idol_namekana like 'ベ%' or idol_namekana like 'ぺ%' or idol_namekana like 'ペ%'
        or idol_namekana like 'ほ%' or idol_namekana like 'ホ%' or idol_namekana like 'ボ%' or idol_namekana like 'ボ%' or idol_namekana like 'ぽ%' or idol_namekana like 'ポ%'")
  }
    scope :get_by_name_ma, ->(name_ma){
    where("idol_namekana like 'ま%' or idol_namekana like 'み%' or idol_namekana like 'む%' or idol_namekana like 'め%'
 or idol_namekana like 'も%'")
  }
    scope :get_by_name_ya, ->(name_ya){
    where("idol_namekana like 'や%' or idol_namekana like 'ヤ%' 
        or idol_namekana like 'ゆ%' or idol_namekana like 'ユ%' 
        or idol_namekana like 'よ%' or idol_namekana like 'ヨ%'")
  }
    scope :get_by_name_ra, ->(name_ra){
    where("idol_namekana like 'ら%' or idol_namekana like 'ラ%' 
        or idol_namekana like 'り%' or idol_namekana like 'リ%'
        or idol_namekana like 'る%' or idol_namekana like 'ル%' 
        or idol_namekana like 'れ%' or idol_namekana like 'レ%' 
        or idol_namekana like 'ろ%' or idol_namekana like 'ロ%'")
  }
    scope :get_by_name_wa, ->(name_wa){
    where("idol_namekana like 'わ%' or idol_namekana like 'ワ%' 
        or idol_namekana like 'ゐ%' or idol_namekana like 'ヰ%' 
        or idol_namekana like 'ゑ%' or idol_namekana like 'ヱ%' 
        or idol_namekana like 'を%' or idol_namekana like 'ヲ%'")
  }
end
