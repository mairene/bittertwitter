#read
get '/tweets/:user_handle' do
  @tweets = Tweet.all
  @user = User.where(handle: params[:user_handle]).first
  @user_tweets = Tweet.where(user_id: @user.id)
  erb :'tweets/tweet_index'
end

#create
get '/tweets/:user_handle/new' do
  @user = User.where(handle: params[:user_handle]).first
  erb :'tweets/new'
end

post '/tweets/:user_handle' do
  @user = User.where(handle: params[:user_handle]).first
  @tweet = Tweet.create(message: params[:message], user_id: @user.id )
  redirect "/tweets/#{@user.handle}"
end

#update(edit)
get '/tweets/:user_handle/edit' do
  p params
  @user = User.where(handle: params[:user_handle]).first
  # @tweet = Tweet.where(id: params[:])
  erb :'tweets/edit'
end

put 'tweets/:user_handle' do
end

#delete
