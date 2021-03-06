class Guest < ActiveRecord::Base
  
  #attr_accessor :password
  #before_save :encrypt_password
  #
  #validates_confirmation_of :password
  #validates_presence_of :password, :on => :create
  #validates_presence_of :email
  #validates_uniqueness_of :email
  
  attr_accessible :given_name, :family_name, :zip, :rsvp, :food, :household_id, :is_child
  
  belongs_to :household
  has_many :households
  
  
  #def self.authenticate(email, password)
  #  guest = find_by_email(email)
  #  if guest && guest.password_hash == BCrypt::Engine.hash_secret(password, guest.password_salt)
  #    guest
  #  else
  #    nil
  #  end
  #end
  #
  #def encrypt_password
  #  if password.present?
  #    self.password_salt = BCrypt::Engine.generate_salt
  #    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  #  end
  #end
  
end
