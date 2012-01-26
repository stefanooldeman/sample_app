require 'spec_helper'

describe UsersController do
    #note this line:
    render_views

    describe "GET 'show'" do

        before(:each) do
            @user = Factory(:user)
        end

        it "should be successful" do
            get :show, :id => @user
            response.should be_success
        end

        it "should find the right user" do
            get :show, :id => @user
            assigns(:user).should == @user
        end
    end

    describe "GET 'new'" do

        it "should be success" do
          get :new
          response.should be_success
        end

        it "should have the right title" do
            base_title = "Ruby on Rails Tutorial Sample App |"
            get :new
            response.should have_selector "title", :content => base_title + " Sign up"
        end
    end
end
