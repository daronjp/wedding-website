class Visitor < ActiveRecord::Base
  
  attr_accessor :password
  before_save :encrypt_password
  
  #validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :group
  validates_uniqueness_of :group
  
  attr_accessible :group, :password, :is_admin
  
  
  def self.authenticate(group, password)
    visitor = find_by_group(group)
    if visitor && visitor.password_hash == BCrypt::Engine.hash_secret(password, visitor.password_salt)
      visitor
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
  
end
