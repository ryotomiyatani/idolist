class Administrator < ApplicationRecord
    validates :name, presence: true, length: { maximum: 255 },
                    format: {with: /\A[a-z0-9]+\z/i}
    validates :password,length: { minimum: 8 }
    has_secure_password
end
