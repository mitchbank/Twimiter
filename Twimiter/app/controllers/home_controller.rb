class HomeController < ApplicationController
  def show
    timeline = $twitter.home_timeline(count: 100)
    # @following = $twitter.user_timeline(count: 1)

    @twinty = {}
    timeline.each do |tweet|
      user_id = tweet.user
      if @twinty[user_id].nil?
        @twinty[user_id] = []
      end
      @twinty[user_id] << tweet
    end

    number_allowed = 2 
    @twinty_one = []
    @twinty.each do |key, value| 
      if value.count > number_allowed
        @twinty_one << value.slice!(0..number_allowed-1)
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
end