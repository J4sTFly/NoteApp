class User < ApplicationRecord
  include EmailValidatable
  has_secure_password

  after_create :send_confirmation_email

  validates :email, email: true, presence: true, uniqueness: true
  validates :password, presence: true, on: :create

  def send_confirmation_email
    token = JsonWebToken.encode(user_id: id)[:token]
    UserMailer.confirm_email(token, email).deliver
  end

  def confirm_email
    self.email_confirmed = true
  end
end
