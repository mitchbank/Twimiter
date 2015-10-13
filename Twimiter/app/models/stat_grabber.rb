class StatGrabber
	def self.run
		
       # Get the current user
       current_user_id = 138536230 #current_user.user_id

       Rails.logger.info "****** #{current_user_id}"

       # Get the list of current user's friends
       friends = $twitter.friend_ids(current_user_id)
       real_friends = friends.attrs[:ids]

       Rails.logger.info "****** #{friends}"

       # For each friend, get:
       real_friends.each do |id|
       		num_tweets = 100 #id.tweets_count.yesterday
       		num_rts = rt_count_helper(id)

       		ts = TweetStat.new(for_date: Date.today, user_id: id, num_tweets: num_tweets, num_rt: num_rts)
       		ts.save
       		Rails.logger.info "****** #{ts}"
       end
       #  - # of retweets from yesterday
       #  - # of tweets
       #
       # Create a new TweetStats instance
       # Save stats into tweetstats
	end
		
       def self.rt_count_helper(id)
       		recent_tweets = $twitter.user_timeline(id, count: 100)
       		count = 0
       		recent_tweets.each do |tweet|
       			count += tweet.retweet_count.to_i
       		end
       		return count
       end
end