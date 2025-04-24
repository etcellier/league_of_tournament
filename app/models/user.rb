class User < ApplicationRecord
  has_secure_password
  
  validates :email, presence: true, uniqueness: true, 
            format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "doit être une adresse email valide" }
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  
  def admin?
    admin == true
  end
end