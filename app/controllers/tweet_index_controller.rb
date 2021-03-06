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

#create tweet with id of user
post '/tweets/:user_handle' do
  @user = User.where(handle: params[:user_handle]).first
  @tweet = Tweet.create(message: params[:message], user_id: @user.id )
  redirect "/users/#{@user.id}"
end

#update(edit)
get '/tweets/:user_handle/edit' do
  @user = User.where(handle: params[:user_handle]).first
  @tweet = Tweet.where(id: params[:tweet_id]).first
  erb :'tweets/edit'
end

put '/tweets/:user_handle' do
  @user = User.where(handle: params[:user_handle]).first
  @tweet = Tweet.where(id: params[:tweet_id]).first

  @tweet.update(message: params[:message])

  if @tweet.save
    p "we are here"
    redirect "/users/#{@user.id}"
  else
    status 402
  end
end

#delete
delete '/tweets/:user_handle' do
  @user = User.where(handle: params[:user_handle]).first
  @tweet = Tweet.where(id: params[:tweet_id]).first

  @tweet.destroy
  redirect "/users/#{@user.id}"
end


