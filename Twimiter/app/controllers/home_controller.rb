class HomeController < ApplicationController
  def index
   response.headers.delete('X-Frame-Options')
   limiter = Limiter.new(params[:t_limit],params[:s_limit])

   @tweets = limiter.limit(current_user) if current_user
   respond_to do |format|
      format.html
      format.json {render json: @tweets.to_json}
   end
  end
end