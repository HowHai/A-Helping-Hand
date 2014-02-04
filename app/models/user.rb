require 'bcrypt'
class User
  # hartl
  # include ActiveModel::SecurePassword

  attr_accessor :password, :password_confirmation

  include Mongoid::Document
  field :name,            type: String
  field :email,           type: String
  field :hashed_password, type: String
  field :salt,            type: String

  # hartl
  # field :password_digest, type: String
  # has_secure_password adds :password and :password_confirmation field


  # hartl
  # has_secure_password
  before_save { self.email = email.downcase }
  before_save :hash_password

  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false}
  validates :password, length: { minimum: 6 }
  # presence validations for :password and :password_confirmation added by
  # has_secure_password

  def authenicated?(pwd)
    self.hashed_password == BCrypt::Engine.hash_secret(pwd, salt)
  end

  private
    def hash_password
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret(password, salt)
      @password, @password_confirmation = nil
    end

end
