OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :identity, :fields => [:email], :model => Authentication
  provider :facebook, '118642853307', 'f550d6110e4ff0e645392af3ee99e8a0'
  provider :twitter, 'TOlaaZGK2P9E1uZWjo84Ig', 'S1kAhA05TaHVGByOgfIJXtjetVRdI4fNLqwCHhEZw'
  provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']  
end