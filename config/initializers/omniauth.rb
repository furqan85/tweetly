Rails.application.config.middleware.use OmniAuth::Builder do
<<<<<<< HEAD
  provider :twitter, "BwigXrUpjnzuLt9zXQp0g", "zekaFvQPngSAIeczwxoJEa4U24E5fA4xIaGdl49kY"
  provider :pocket, "19060-6adbbe3abe1487b229acf242"
=======
  provider :twitter, Settings.twitter.key, Settings.twitter.secret
>>>>>>> master
end