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

    private

        def encrypt_password
            self.encrypted_password = encrypt(password)
        end

        def encrypt(string)
            string # @todo implement this
        end
end
