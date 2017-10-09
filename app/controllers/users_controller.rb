class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:name] != nil && params[:name].length > 1
      if params[:name].split.first.length >= 1 && params[:name].split[1] == nil
        @users = User.includes(:profile).select { |user| user.profile != nil && (user.profile.first_name.upcase == params[:name].split.first.upcase || user.profile.last_name.upcase == params[:name].split.first.upcase) }
      end
    else
      @users = User.includes(:profile)
    end
    
    if params[:name] != nil && params[:name].length > 1
      if params[:name].split.first.length >= 1 && params[:name].split[1] != nil && params[:name].split[1].length >= 1
        @users = User.includes(:profile).select { |user| user.profile != nil && ((user.profile.first_name.upcase == params[:name].split.first.upcase && user.profile.last_name.upcase == params[:name].split[1].upcase) || (user.profile.first_name.upcase == params[:name].split.last.upcase && user.profile.first_name.upcase == params[:name].split[1].upcase)) }
      end
    end
    
     if params[:job] != nil && (params[:job] == "Developer" || params[:job] == "Developpeur")
       @users = @users.select { |user| user.profile != nil && (user.profile.job_title.upcase == "Developer".upcase || user.profile.job_title.upcase == "Developpeur".upcase) }
     elsif params[:job] != nil && (params[:job] == "Investor" || params[:job] == "Investisseur")
       @users = @users.select { |user| user.profile != nil && (user.profile.job_title.upcase == "Investor".upcase || user.profile.job_title.upcase == "Investisseur".upcase) }
     elsif params[:job] != nil && (params[:job] == "Contractor" || params[:job] == "Entrepreneur")
       @users = @users.select { |user| user.profile != nil && (user.profile.job_title.upcase == "Contractor".upcase || user.profile.job_title.upcase == "Entrepreneur".upcase) }
     end
     
     @users = Kaminari.paginate_array(@users).page(params[:page]).per(6)
     
  end
  
  # /users/:id
  def show
    @user = User.find(params[:id])
  end
end
