Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook, '498576500177080','e3f52b392122287ea64e8dcb43383331', {:scope => "publish_stream,offline_access,email"}
end
