Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['816245395154372'], ENV['92ad0d11ec1185f4213c343d5e9ce3fc']
end