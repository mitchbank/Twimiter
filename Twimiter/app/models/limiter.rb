class Limiter
	def initialize(t_limit, s_limit)
		@t_limit = t_limit
		#@s_limit = s_limit
	end

	def limit
		timeline = $twitter.home_timeline(count: 200)

		twinty = {}
		timeline.each do |tweet|
		  user_id = tweet.user
		  if twinty[user_id].nil?
			twinty[user_id] = []
		  end
		  twinty[user_id] << tweet
		end

		twinty_one = []
		twinty.each do |key, value| 
			tweet_stat = TweetStat.find_by(user_id: key.id, for_date: Date.today)
			if tweet_stat
			twinty_one << value.select do |tweet|
		 	 tweet.retweet_count > tweet_stat.rt_per_tweet
		 	end
		  	end
		end

		tweets = twinty_one.flatten 
		tweets.sort_by! do |tw|
		  tw.created_at
		end
		tweets.reverse!
	end
end