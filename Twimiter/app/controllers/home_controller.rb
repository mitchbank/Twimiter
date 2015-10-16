class HomeController < ApplicationController
  def show
   limiter = Limiter.new(params[:t_limit],params[:s_limit])

   @tweets = limiter.limit(current_user) if current_user
  end
end