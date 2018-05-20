class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  # before_action :authenticate_user!

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
  end

  def user_session
    if User.where(user: current_user.name).present?
      redirect_to root_path
    else
      flash[:notice] = 'Error'
      redirect_to root_path
    end
  end
end
