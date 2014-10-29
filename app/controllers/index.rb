get '/' do
  # Look in app/views/index.erb
  case params[:create]
  when "success"
    @color = "green"
    @message = "Account succesfully created, please login"
  when "wrong_password"
    @color = "red"
    @message = "The password you entered is incorrect"
  when "no_account"
    @color = "red"
    @message = "The account you entered is invalid"
  else
    @message = ""
  end

  erb :index
end

