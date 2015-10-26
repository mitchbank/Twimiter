class TweetStat < ActiveRecord::Base
	def rt_per_tweet
		num_rt/num_tweets
	end
end
