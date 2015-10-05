class SessionsController < ApplicationController
  def new

  end
  def create
    @user = User.from_omniauth(auth_hash)
    session[:user_id] = @user.id
    redirect_to '/'
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