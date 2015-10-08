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

    number_allowed = 1 
    @twinty_one = []
    @twinty.each do |key, value| 
      # binding.pry 
      # if value.count > number_allowed
      @twinty_one << value.first
        # binding.pry 
      # end
    end
    @tweets = @twinty_one.flatten 
    @tweets.sort_by do |tw|
      tw.id
    end
  end
end