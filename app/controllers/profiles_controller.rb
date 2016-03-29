class ProfilesController < ApplicationController
  def index
    @profile = Profile.find_by_user_id(current_user)
    @posts = @profile.user.posts
    @liked_posts = @profile.user.find_voted_items

    #@profile = Profile.find_by_user_id(current_user)
  end

  def edit
    @profile = Profile.find_by_user_id(current_user)
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to profiles_path
    else
      render 'edit'
    end
  end

  def show
    @profile = Profile.find(params[:id])
    @posts = @profile.user.posts
    @liked_posts = @profile.user.find_voted_items
  end
  private
    def profile_params
    params.require(:profile).permit(:firstname,:lastname,:about_me,:avatar)
  end
end
