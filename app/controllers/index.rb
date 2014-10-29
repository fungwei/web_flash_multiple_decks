get '/' do
  # Look in app/views/index.erb
  case params[:notice]
  when "success"
    @color = "green"
    @message = "Account succesfully created, please login"
  when "wrong_password"
    @color = "red"
    @message = "The password you entered is incorrect"
  when "no_account"
    @color = "red"
    @message = "The account you entered is invalid"
  when "no_login"
    @message = "Please login to view content"
    @color = "red"
  when "logout_success"
    @message = "You have been succesfully logged out"
    @color = "green"
  else
    @message = ""
  end

  erb :index
end

