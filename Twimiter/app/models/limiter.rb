class Limiter
	def initialize(t_limit, s_limit)
		@t_limit = t_limit
		#@s_limit = s_limit
	end

	def limit(user)

		timeline = user.twitter_client.home_timeline(count: 200)
		timeline2 = user.twitter_client.home_timeline(count: 200, max_id: timeline.last.id)
		timeline3 = user.twitter_client.home_timeline(count: 200, max_id: timeline2.last.id)
		timeline4 = user.twitter_client.home_timeline(count: 200, max_id: timeline3.last.id)
		timeline5 = user.twitter_client.home_timeline(count: 200, max_id: timeline4.last.id)

		real_timeline = [timeline, timeline2, timeline3, timeline4, timeline5]

		twinty = {}
		real_timeline.each do |timeline|
			timeline.each do |tweet|
		  	user_id = tweet.user
		  		if twinty[user_id].nil?
						twinty[user_id] = []
		  		end
		  	twinty[user_id] << tweet
		 	end
		end

		twinty_one = []
		twinty.each do |key, value|
			tweet_stat = TweetStat.find_by(user_id: key.id, for_date: Date.today.to_datetime)
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