#login from index with handle and password validation
get "/user" do
  @handle = params[:handle]
  @password = params[:password]
  @user = User.where(handle: @handle).first
  if @user != nil
    if @user.password == @password
      erb :"user_views/profile_page"
    else
      redirect "/?no_password=true"
    end
  else
    redirect "/?no_user=true"
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
    redirect "/?created=false"
  end
end

#display user's edit page
get "/users/:id/edit" do
  @id = params[:id].to_i
  @user = User.where(id: @id).first
  @unique_handle = params[:unique_handle]
  erb :"user_views/edit"
end

#display user profile page
get "/users/:id" do
  @user = User.where(id: params[:id]).first
  erb :"user_views/profile_page"
end

#edit user
put "/users/:id/edit" do
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





