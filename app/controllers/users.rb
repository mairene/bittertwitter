get "/user" do
  p params
  @handle = params[:handle]
  @password = params[:password]
  @user = User.where(handle: @handle).first
  if @user != nil
    if @user.password == @password
      erb :"user_views/profile_page"
    else
      # @no_user = "Not a valid username and password"
      redirect "/"
    end
  else
    # @no_user = "Not a valid username and password"
    redirect "/"
  end
end

get "/users/new" do
  @email = params[:new_email]
  @password = params[:new_password]
  @handle = params[:new_username]
  @user = User.new(email: @email, password: @password, handle: @handle)
  if @user.save
    erb :"user_views/profile_page"
  else
    redirect "/"
  end
end



