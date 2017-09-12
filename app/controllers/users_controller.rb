class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:name] != nil
      @users = User.select { |user| user.profile != nil && user.profile.first_name == "William"}
      if @users.save
        redirect_to "/users"
      else
        render action :new
      end
    else
      @users = User.includes(:profile)
    end
  end
  
  # /users/:id
  def show
    @user = User.find(params[:id])
  end
end
