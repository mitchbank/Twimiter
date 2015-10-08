class HomeController < ApplicationController
  def show
   limiter = Limiter.new(params[:t_limit],params[:s_limit])

   @tweets = limiter.limit
  end

  def create
    if @options.save
      redirect_to root_path
    else 
      flash.now[:alert] = "Invalid Entry"
    end
  end
end