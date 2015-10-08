class Limiter
	def initialize(t_limit, s_limit)
		@t_limit = t_limit
		@s_limit = s_limit
	end

	def limit
		timeline = $twitter.home_timeline(count: @s_limit.to_i)

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
		  if value.count > @t_limit.to_i
			twinty_one << value.slice!(0..@t_limit.to_i - 1)
		  end
		end
		tweets = twinty_one.flatten 
		tweets.sort_by! do |tw|
		  tw.created_at
		end
		tweets.reverse!
	end
end