Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['SPOT_CLI_ID'], ENV['SPOT_CLI_SEC'], scope: 'playlist-modify-public user-read-private user-read-email'
end
