class HomeController < ApplicationController
  get "/" do
    if user_signed_in?
      @current_user = CLIENT.user
      user_email_exists
    end

    @users = User.all
    erb :'home/index'
  end

  get "/oauth/connect" do
    redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

  get "/oauth/logout" do
    session.clear
    redirect '/'
  end

  get "/oauth/callback" do
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    session[:access_token] = response.access_token

    client = Instagram.client(:access_token => session[:access_token])

    @user = User.find_or_create_by(instagram_id: client.user.id) do |user|
      user.username         = client.user.username
      user.website          = client.user.website
      user.profile_picture  = client.user.profile_picture
      user.full_name        = client.user.full_name
      user.bio              = client.user.bio
      user.media            = client.user.counts.media
      user.followed_by      = client.user.counts.followed_by
      user.follows          = client.user.counts.follows
    end

    redirect '/'
  end

  def user_email_exists
    if user_signed_in?
      user = User.find_by(instagram_id: CLIENT.user.id)

      if user.email.nil? || user.email.empty?
        redirect :'user/new'
      end
    end
  end

end