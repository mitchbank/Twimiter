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

  # def auto_link(text, options = {}, &block)
  #   auto_link_entities(text, Extractor.extract_entities_with_indices(text, :extract_url_without_protocol => false), options, &block)
  # end
end