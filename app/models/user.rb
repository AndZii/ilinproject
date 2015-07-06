class User < ActiveRecord::Base
  validates :email, :name, presence: true
  validate :email_check, :on => :create
  validate :country_check, :on => :create
   def country_check
     if self.country == "Select your country"
       self.errors.add(:country, 'Can not be empty!')
       return false
     end
   end

   def email_check
     if self.email.split("@").count < 2
       self.errors.add(:email, 'Email not valid!')
       return false
     end
     if self.email.split('@')[1].split(".").count < 2
       self.errors.add(:email, 'Email not valid!')
       return false
     end
   end
end
