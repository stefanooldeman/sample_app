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

end
