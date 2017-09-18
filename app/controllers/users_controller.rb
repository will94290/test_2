class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:name] != nil && params[:name].length > 1
      @users = User.includes(:profile).select { |user| user.profile != nil && user.profile.first_name.upcase == params[:name].upcase}
    else
      @users = User.includes(:profile)
    end
    if params[:second] != nil && params[:second].length > 1
      @users = @users.select { |user| user.profile != nil && user.profile.last_name.upcase == params[:second].upcase}
    else
      @users = @users
    end
    if params[:job] != nil && params[:job] != "Job title"
       @users = @users.select { |user| user.profile != nil && user.profile.job_title.upcase == params[:job].upcase}
     else
      @users = @users
    end
  end
  
  # /users/:id
  def show
    @user = User.find(params[:id])
  end
end
