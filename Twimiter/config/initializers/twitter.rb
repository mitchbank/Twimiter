$twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
  #config.access_token = oauth_token
  #config.access_token_secret = oauth_secret
end

# Pusher.app_id = Figaro.env.pusher_app_id!
# Pusher.key    = Figaro.env.pusher_key!
# Pusher.secret = Figaro.env.pusher_secret!