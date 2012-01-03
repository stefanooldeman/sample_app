require 'spec_helper'

describe User do
    before :each do
        # valid params
        @params = {
            :name => "Example user",
            :email => "john@example.com",
            :password => "123456foobar",
        }
    end

    it "should create a new instance given valid attributes" do
        User.create! @params
    end

    it "should require a name" do
        user = User.new(@params.merge :name => "")
        user.name?
        user.should_not be_valid
    end

    it "should require a email" do
        user = User.new(@params.merge :email => "")
        user.email?
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

    it "should reject duplicate email addresses" do
        # Put a user with given email address into the db
        User.create! @params
        user = User.new @params
        user.should_not be_valid
    end

    it "should reject duplicate email addresses (identical up to case)" do
        upcased_email = @params[:email].upcase
        User.create! @params.merge :email => upcased_email
        user = User.new @params
        user.should_not be_valid
    end

    describe "password validation" do

        it "should require a password" do
            user = User.new(@params.merge :password => "")
            user.should_not be_valid
        end

        it "should reject short passwords" do
            short = "a" * 5
            hash = @params.merge :password => short
            User.new(hash).should_not be_valid
        end

        it "should reject long passwords" do
            long = "a" * 41
            hash = @params.merge :password => long
            User.new(hash).should_not be_valid
        end
    end

    describe "password encryption" do
    
        before (:each) do
            @user = User.create!(@params)
        end

        it "should have an encrypted password attribute" do
            @user.should respond_to(:encrypted_password)
        end

        it "should set the encryption password" do
            @user.encrypted_password.should_not be_blank
        end
    end
end
