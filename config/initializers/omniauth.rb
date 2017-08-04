Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'YWhZd6RjjYd3xsPUIZmfwBmF8', 'Xt31Nj8Q4EoDFph5y4mOWQ2Sj3Zcl0PbJIPpStTNmUnTaQnxBj'
  provider :facebook, '830813213640000', 'b65333815b7b6de2615e36cdcfb52541'#, {:scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
end