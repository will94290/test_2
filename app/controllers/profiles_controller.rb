class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :only_current_user
  
  # GET to /users/:user_id/profile/home
  def new
    # Render blank profile details form
    @profile = Profile.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile updated !"
      redirect_to "/users/#{params[:user_id]}"
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:user_id])
    if @user.profile == nil
      @profile = Profile.new
    else
      @profile = @user.profile
    end
  end

  def update
    @user = User.find(params[:user_id])
    @profile = @user.profile
    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile updated !"
      redirect_to "/users/#{params[:user_id]}"
    else
      render :edit
    end
  end

   private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :city, :contact_email, :description, :service_offer, :reference)
  end

  def only_current_user
    @user = User.find(params[:user_id])
    redirect_to(root_url) unless @user == current_user
  end
end
