class User < ActiveRecord::Base
    attr_accessible :name, :email

    validates :name, :presence => true,
                     :length => { :maximum => 40 }

    email_pattern = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, :presence => true,
                      :format => { :with => email_pattern }
end
