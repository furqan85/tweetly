class SessionsController < ApplicationController
  def create
  	user = User.from_omniauth(env['omniauth.auth'])
  	session[:user_id] = user.id
  	redirect_to root_url, notice: "Signed in!"
  end

  def pocket
    conn = Connection.from_omniauth(env['omniauth.auth'])
    redirect_to root_url, notice: "Connected!"
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, notice: "Signed out!"
  end
end
