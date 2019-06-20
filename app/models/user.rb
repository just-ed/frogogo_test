class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  
  has_secure_password

  validates :phone_number, presence: true, 
                           uniqueness: true,
                           numericality: true,
                           length: { minimum: 10 }
  validates :name, presence: true, length: { minimum: 2 }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  before_validation :clean_number, only: :phone_number

  def clean_number
    self.phone_number.gsub!(/[\+\-\s()]/, "")
  end
end
