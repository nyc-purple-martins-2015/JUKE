Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['SPOT_ID'], ENV['SPOT_SECRET'], scope: 'playlist-modify-public user-read-private user-read-email'
end
