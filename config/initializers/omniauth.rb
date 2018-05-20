Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :github, 'b84502e5c94d0fdfd756', '49511d4ae1bfdf1342aebe0624bc355756627b60'
end
