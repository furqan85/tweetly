class HomeController < ApplicationController
  def index
  	@tweets = current_user.twitter.home_timeline
  end
end
