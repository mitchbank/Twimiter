class StatGrabber
	def self.run
		
       current_user_id = 138536230 #current_user.user_id

       #Rails.logger.info "****** #{current_user_id}"

       friends = $twitter.friend_ids(current_user_id)
       real_friends = friends.attrs[:ids]

       #Rails.logger.info "****** #{friends}"

       real_friends.each do |id|
       		num_tweets = 100 #id.tweets_count.yesterday
       		num_rts = rt_count_helper(id)

       		ts = TweetStat.new(for_date: Date.today, user_id: id, num_tweets: num_tweets, num_rt: num_rts)
       		ts.save
       		#Rails.logger.info "****** #{ts}"
       end
     
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