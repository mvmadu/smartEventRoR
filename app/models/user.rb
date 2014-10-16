class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  attr_accessor :password
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, email_format: { message: "doesn't look like an email address" }
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create
  before_save :encrypt_password
  after_save :clear_password
  salt = BCrypt::Engine.generate_salt
  encrypted_password = BCrypt::Engine.hash_secret(:password, salt)
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    end
  end
  def clear_password
    self.password = nil
  end
  
  def self.authenticate(username="", login_password="")
    user = User.find_by_username(username)
        
    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end   
  
  def match_password(login_password="")
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end
end
