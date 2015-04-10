get "/" do
  @no_user = params[:no_user]
  @no_password  = params[:no_password]
  @not_created = params[:created]
  erb :index
end

