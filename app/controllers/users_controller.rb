class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @full_title = @user.name
  end

  def new
      @title = "Sign up"
  end

end
