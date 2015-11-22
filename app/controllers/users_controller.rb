class UsersController < Devise::RegistrationsController
  before_filter :authenticate_user!

  def index
      @users = User.where.not("id = ?",current_user.id).order("created_at DESC")
      @conversations = Conversation.involving(current_user).order("created_at DESC")
  end

  def after_sign_in_path_for(resource)
      profile_path(resource)
  end

  def show
    @user = User.find(params[:id])
  end
end
