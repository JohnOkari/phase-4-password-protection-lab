class User < ApplicationRecord
    has_secure_password
  
    # validates :username, presence: true, uniqueness: true
    # validates :password, length: { minimum: 6 }
    validate :password_confirmation_matches
  
    private
  
    def password_confirmation_matches
      if password_confirmation.present? && password != password_confirmation
        errors.add(:password_confirmation, "doesn't match Password")
      end
    end
  end
  