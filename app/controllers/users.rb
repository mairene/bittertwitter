#login from index with handle and password validation
get "/user" do
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

#from index create new user
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

#display user's edit page
get "/users/:id" do
  @id = params[:id].to_i
  @user = User.where(id: @id).first
  @unique_handle = params[:unique_handle]
  erb :"user_views/edit"
end

#edit user
put "/users/:id" do
  new_handle = params[:handle]
  new_email = params[:email]
  @id = params[:id]
  @user = User.where(id: @id).first
  @user.email = new_email
  @user.handle = new_handle
  if @user.save
    erb :"user_views/profile_page"
  else
    redirect "/users/#{@id}?unique_handle=false"
  end
end

#delete user
delete "/users/:id" do
  @id = params[:id].to_i
  @user = User.where(id: @id).first
  @user.destroy
  redirect "/"
end





