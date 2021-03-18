class SessionsController < ApplicationController
  skip_before_action :authorize!, only: :create

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to mypage_path
    else
      render 'home/index'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
