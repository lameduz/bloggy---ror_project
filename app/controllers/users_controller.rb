class UsersController < ApplicationController
  def new
    @user = User.new

    @profile = Profile.new
  end

  def create
    @user = User.new(user_params)

    #@user.build_profile(profile_params)
    if @user.save
      #On fera un système de confirmation par mail si on est bouillant
      #Pour l'instant on redirige car on a la flème
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, profile_attributes:[:id,:firstname,:lastname])
  end
end
