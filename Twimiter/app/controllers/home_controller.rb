class HomeController < ApplicationController
  def show
    @tweet_limit = params[:t_limit]
    @scope_limit = params[:s_limit]
    timeline = $twitter.home_timeline(count: @scope_limit.to_i)
    # @following = $twitter.user_timeline(count: 1)

    @twinty = {}
    timeline.each do |tweet|
      user_id = tweet.user
      if @twinty[user_id].nil?
        @twinty[user_id] = []
      end
      @twinty[user_id] << tweet
    end

    @twinty_one = []
    @twinty.each do |key, value| 
      if value.count > @tweet_limit.to_i
        @twinty_one << value.slice!(0..@tweet_limit.to_i - 1)
      end
    end
    @tweets = @twinty_one.flatten 
    # binding.pry
    @tweets.sort_by! do |tw|
      tw.created_at
      # binding.pry
    end
    @tweets.reverse!
  end

  def create
    if @options.save
      redirect_to root_path
    else 
      flash.now[:alert] = "Invalid Entry"
    end
  end
end