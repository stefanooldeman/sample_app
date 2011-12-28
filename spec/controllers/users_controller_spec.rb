require 'spec_helper'

describe UsersController do
    #note this line:
    render_views

    describe "GET 'new'" do
        it "returns http success" do
          get 'new'
          response.should be_success
        end

        it "should have the right title" do
            base_title = "Ruby on Rails Tutorial Sample App |"
            get 'new'
            response.should have_selector "title", :content => base_title + " Sign up"
        end
    end
end
