class SessionsController < ApplicationController
  def new

  end

  def create
    puts auth_hash.inspect
    @user = User.from_omniauth(auth_hash)
    StatGrabber.run(@user)
    session[:user_id] = @user.id
    redirect_to "https://twitter.com"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  protected

  def auth_hash
    env['omniauth.auth']
  end
end