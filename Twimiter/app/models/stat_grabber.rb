class StatGrabber

	def self.run(user)
              begin
                     twitter_client = user.twitter_client
                     friends = twitter_client.friend_ids(user.uid.to_i)
                     real_friends = friends.attrs[:ids]

                     real_friends.each do |id|
                            if TweetStat.where(for_date: Date.today.to_datetime, user_id: id).empty?
              		     num_tweets = 100
              		     num_rts = rt_count_helper(twitter_client, id)

              		     ts = TweetStat.new(for_date: Date.today, user_id: id, num_tweets: num_tweets, num_rt: num_rts)
              		     ts.save
                            end
                     end
              rescue Twitter::Error::TooManyRequests => e

                  Rails.logger.error e.message

              end

	end

       def self.rt_count_helper(client, id)
       		recent_tweets = client.user_timeline(id, count: 100)
       		count = 0
       		recent_tweets.each do |tweet|
       			count += tweet.retweet_count.to_i
       		end
       		return count
       end
end