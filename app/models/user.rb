class User < ApplicationRecord
  before_save{ self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :password,length: { minimum: 8 }
  has_secure_password
  

  has_many :thoughts
  has_many :idols, through: :thoughts
  has_many :likes
  has_many :think_likes, through: :likes, class_name: 'Idol', source: :idol
  has_many :go_to_wents
  has_many :think_goes, through: :go_to_wents, class_name: 'Idol', source: :idol
  has_many :thoughts, dependent: :delete_all
  
  def like(idol)
    self.likes.find_or_create_by(idol_id: idol.id)
  end

  def unlike(idol)
    idol = self.likes.find_by(idol_id: idol.id)
    idol.destroy  if idol
  end

  def like?(idol)
    self.think_likes.include?(idol)
  end
  
  def go_to_went(idol)
     self.go_to_wents.find_or_create_by(idol_id: idol.id)
  end

  def not_go(idol)
    idol = self.go_to_wents.find_by(idol_id: idol.id)
    idol.destroy if idol
  end

  def go_to_went?(idol)
    self.think_goes.include?(idol)
  end
end
