class UserController < ApplicationController

  get '/user/new' do
    @user = User.find_by(instagram_id: CLIENT.user.id)
    erb :'user/new'
  end

  post '/user' do
    @user = User.find_by(instagram_id: CLIENT.user.id)
    @user.update(params[:user])
    redirect :'/'
  end

end