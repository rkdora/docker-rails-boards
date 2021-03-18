class ApplicationController < ActionController::Base
  include SessionsHelper

  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  before_action :authorize!

  def authorize!
    redirect_to(root_path, danger: 'Please login') unless logged_in?
  end
end
