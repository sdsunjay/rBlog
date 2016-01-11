class User < ActiveRecord::Base
  attr_accessor :password_confirmation 
  # Note. You do not need this field in database, it's for 1-time use

  # The following 2 lines let you prevent certain fields
# attr_accessible :email
# attr_protected :password
  attr_accessor :password
  before_save :encrypt_password
  has_many :posts

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password, confirmation: true

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
    else
        nil
    end
  end
  def encrypt_password
      if password.present?
          self.password_salt = BCrypt::Engine.generate_salt
          self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
       end
  end
    def self.search(query)
      where("first_name like ? OR last_name like ? OR email like ?","%#{query}%","%#{query}%","%#{query}%")
    end
end
