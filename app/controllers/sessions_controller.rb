class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    session[:omniauth] = auth.except('extra')
    user = User.sing_in_from_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    seession[:user_id] = nil
    seession[:omniauth] = nil
    redirect_to root_url
  end
end
