require 'spec_helper'

describe "LayoutLinks" do

    it "should have a Home page at '/'" do
        get '/'
        response.should have_selector 'title', :content => "Home"
    end

    it "should have a Contact page at '/contact" do
        get '/contact'
        response.should have_selector 'title', :content => "Contact"
    end

    it "should have an About page at '/about'" do
        get '/about'
        response.should have_selector 'title', :content => "About"
    end

    it "should have an Help page at '/help'" do
        get '/help'
        response.should have_selector 'title', :content => "Help"
    end

    it "should have an signup page at '/signup'" do
        get '/signup'
        response.should have_selector 'title', :content => "Sign up"
    end
    
    it "should have the right links on the layout" do
        #start 
        visit root_path

        #visit all pages
        #important this is an Ordered list ( "sign up" link is only available on Home page )
        list = ["Home", "Sign up", "About", "Help", "Contact"]
        for item in list do
            click_link item
            response.should have_selector 'title', :content => item
        end
    end
end

