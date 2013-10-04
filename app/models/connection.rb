class Connection < ActiveRecord::Base
  attr_accessible :access_token, :service_id, :user_id, :username

  belongs_to :user
  belongs_to :service

  def self.from_omniauth(auth)
    connection ||= where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
    connection.oauth_token = auth["credentials"]["token"]
    connection.save!
    connection
  end

  def self.create_from_omniauth(auth)
    create! do |connection|
      connection.provider = auth["provider"]
      connection.uid = auth["uid"]
      connection.username = auth["info"]["nickname"]
    end
  end
  
end
