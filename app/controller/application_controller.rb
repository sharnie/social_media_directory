class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "lkwsdenwusds0d9889e2sdkjsd"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions

  CALLBACK_URL = "http://localhost:3000/oauth/callback"

  Instagram.configure do |config|
    config.client_id = "73a37dc40e294594a83cb4ec50d9adcd"
    config.client_secret = "44cf05a853724a0bb89dbcd32fb6d669"
    # For secured endpoints only
    #config.client_ips = '<Comma separated list of IPs>'
  end

  before do
    CLIENT = Instagram.client(:access_token => session[:access_token])
  end

  def user_signed_in?
    true if session[:access_token]
  end

end