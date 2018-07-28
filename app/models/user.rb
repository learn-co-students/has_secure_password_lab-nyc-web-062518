class User < ActiveRecord::Base
  validates :password, presence: true
  validate :password_validation

  def password_validation
    if password_confirmation && password != password_confirmation
      errors.add(:password_confirmation, "password and password confirmation must match")
    end
  end

  def authenticate(password)
    return nil unless password == self.password
    self
  end
end
