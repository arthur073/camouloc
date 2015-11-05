Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook, '964848846886854','9d3c3f8e166f4bdfb28e467efd01540b', {:info_fields => "name,email", :scope => "email,public_profile", :display => 'page'}
 provider :google_oauth2, '735952069573-v395b38d0onu92ibd1ko4rj0ucg27o62.apps.googleusercontent.com', 'bMgcuKiVmXaeUL3Qj865MZsx', scope: 'email,profile', image_aspect_ratio: 'square', image_size: 48, access_type: 'online'
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}