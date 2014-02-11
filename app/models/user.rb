require 'bcrypt'
class User
  include Mongoid::Document

  attr_accessor :password

  field :name,            type: String
  field :email,           type: String
  field :hashed_password, type: String
  field :salt,            type: String

  # Relation to Person model
  has_many :people

  # before_save { self.email = email.downcase }

  # validations
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false}
  validates :password, length: { minimum: 6 }

  before_save :hash_password


  def authenticated?(pwd)
    self.hashed_password == BCrypt::Engine.hash_secret(pwd, self.salt)
  end


  private
    def hash_password
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret(self.password, self.salt)
      self.password = nil
    end
end
