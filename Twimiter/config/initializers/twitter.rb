$twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['twitter_consumer_key']
  config.consumer_secret = ENV['twitter_consumer_secret']
  config.access_token = ENV['twitter_access_token']
  config.access_token_secret = ENV['twitter_access_token_secret']
  #config.access_token = oauth_token
  #config.access_token_secret = oauth_secret
end

# Pusher.app_id = Figaro.env.pusher_app_id!
# Pusher.key    = Figaro.env.pusher_key!
# Pusher.secret = Figaro.env.pusher_secret!