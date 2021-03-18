class UsersController < ApplicationController
  skip_before_action :authorize!, only: [:new, :create]

  def new
    @user = User.new(flash[:user])
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in user
      redirect_to mypage_path
    else
      redirect_back fallback_location: root_path, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end

  def me; end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
