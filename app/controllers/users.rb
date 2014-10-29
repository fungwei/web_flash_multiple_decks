

get '/users/logout' do
  session[:username] = nil
  redirect "/"
end


post '/users' do
  if params[:submit] == "create"
    User.create(username: params[:username], password: params[:password])
    redirect "/?create=success"
  else
    # byebug
    if User.valid?(params[:username])
    new_user = User.where(username: params[:username]).first
      if new_user.authenticate(params[:password])
        'You are logged in'
        session[:username] = params[:username]
        redirect "/flashcards"
      else
        redirect "/?create=wrong_password"
      end
    else
      redirect "/?create=no_account"
    end
  end

end