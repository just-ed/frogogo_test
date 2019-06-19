class User < ApplicationRecord
  has_secure_password

  validates :phone_number, presence: true, uniqueness: true, numericality: true
  validates :name, presence: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
end
