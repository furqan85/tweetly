class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid

  has_many :connections
  has_many :services, through: :connections

  def self.from_omniauth(auth)
  	user ||= where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  	user.oauth_token = auth["credentials"]["token"]
	user.oauth_secret = auth["credentials"]["secret"]
	user.save!
	user
  end

  def self.create_from_omniauth(auth)
  	create! do |user|
  		user.provider = auth["provider"]
  		user.uid = auth["uid"]
  		user.name = auth["info"]["nickname"]
  	end
  end

  def twitter
	if provider == "twitter"
		@twitter ||= Twitter::Client.new(consumer_key: Settings.twitter.key, consumer_secret: Settings.twitter.secret, oauth_token: oauth_token, oauth_token_secret: oauth_secret)
	end
  end
end
