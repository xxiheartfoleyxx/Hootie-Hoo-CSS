class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
    @profile.user_id = current_user.id
    @profile.save
  end

  def index
  end
end
