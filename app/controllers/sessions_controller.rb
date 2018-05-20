class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    session[:omniauth] = auth.except('extra')
    user = User.sing_in_from_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, notice: 'You are sing in'
  end

  def destroy
    session[:user_id] = nil
    session[:omniauth] = nil
    redirect_to root_url, notice: 'You are sing out'
  end
end
