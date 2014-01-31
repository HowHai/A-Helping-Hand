class User
  include ActiveModel::SecurePassword
  include Mongoid::Document
  field :name,            type: String
  field :email,           type: String
  field :password_digest, type: String
  # has_secure_password adds :password and :password_confirmation field


  has_secure_password
  before_save { self.email = email.downcase }

  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false}
  validates :password, length: { minimum: 6 }
  # presence validations for :password and :password_confirmation added by
  # has_secure_password
end
