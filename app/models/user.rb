class User < ActiveRecord::Base
    attr_accessible :name, :email

    email_pattern = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :name, :presence => true,
                     :length => { :maximum => 40 }

    validates :email, :presence => true,
                      :format => { :with => email_pattern },
                      :uniqueness => { :case_sensitive => false }
                        
    
end
