class HomeController < ApplicationController
  def show
    @timeline = $twitter.home_timeline
  end
end