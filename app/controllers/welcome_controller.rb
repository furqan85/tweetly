class WelcomeController < ApplicationController
  def index
  	if current_user
  		redirect_to home_url
  	end
  end
end
