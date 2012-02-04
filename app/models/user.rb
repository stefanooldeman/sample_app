require 'digest'
class User < ActiveRecord::Base
    attr_accessor   :password
    attr_accessible :name, :email, :password


    email_pattern = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :name, :presence => true,
                     :length => { :maximum => 40 }

    validates :email, :presence => true,
                      :format => { :with => email_pattern },
                      :uniqueness => { :case_sensitive => false }
                        
    validates :password, :presence  => true,
                         :length => { :within => 6..40 }

    before_save :encrypt_password

    
    def has_password? (string)
        encrypted_password == encrypt(string)
    end

    def self.authenticate (email, submitted_password)
        user = find_by_email(email)
        return nil if user.nil?
        return user if user.has_password?(submitted_password)
    end

    private

        def encrypt_password
            # called before save
            self.salt = make_salt if new_record?
            self.encrypted_password = encrypt(password)
        end

        def encrypt(string)
            secure_hash("#{salt}--#{string}") 
        end

        def secure_hash(string)
            Digest::SHA2.hexdigest(string)
        end

        def make_salt
            my_secret = 'HFY*)RY@#LHJHdfgwy802hrgfd8sY&^WPQE*j;cJ*@WUFPDL'
            secure_hash "#{Time.now.utc}--#{my_secret}"
        end
end
