require 'spec_helper'

describe User do
    before :each do
        # valid params
        @params = {:name => "Example user", :email => "john@example.com"}
    end

    it "should create a new instance given valid attributes" do
        User.create! @params
    end

    it "should require a name" do
        user = User.new(@params.merge :name => "")
        user.should_not be_valid
    end

    it "should require a email" do
        user = User.new(@params.merge :email => "")
        user.should_not be_valid
    end

    it "should reject names that are too long" do
        long_name = "a" * 41
        user = User.new(@params.merge :name => long_name)
        user.should_not be_valid
    end

    it "should reject invalid email addresses" do
        invalid_list = ["@domain.com", "domain.com", "@", ".nl", "myplaintext", "user@foo,com", "user_at_foo.org", "example.user@foo."]
        invalid_list.each do |address|
            user = User.new(@params.merge :email => address)
            user.should_not be_valid
        end
    end

    it "should accept valid email addresses" do
        invalid_list = ["stefano.oldeman@gmail.com", "THE_USER@foo.bar.org", "first.last@foo.jp", "slut_183@hotmail.com"]
        invalid_list.each do |address|
            user = User.new(@params.merge :email => address)
            user.should be_valid
        end
    end

end
