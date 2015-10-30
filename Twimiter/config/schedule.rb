set :environment, 'development'
set :output, "#{path}/whenever.log"

every 1.day, at: '4:40 am' do
  runner "StatGrabber.run"
end
