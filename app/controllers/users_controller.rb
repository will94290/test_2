class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:name] != nil && params[:name].length > 1
      @users = User.includes(:profile).select { |user| user.profile != nil && user.profile.first_name == params[:name]}
      #redirect_to "/users"
    else
      @users = User.includes(:profile)
    end
  end
  
  # /users/:id
  def show
    @user = User.find(params[:id])
  end
end
