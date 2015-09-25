class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :likes
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :alias, :email, :password, presence: true
  # validates :name, :alias, :email, :password, presence: true, length: {in 2..20}
  validates :email, presence: true, format: {with: EMAIL_REGEX}, uniqueness: {case_sensitive:false}

  # validates :email, presence: true,format: {with: EMAIL_REGEX, message: "incorrect email format"},uniqueness: {case_sensitive: false}
  # validates :password, length: {minimum: 3}

end
