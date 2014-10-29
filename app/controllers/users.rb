
get '/users/create' do
  erb :'users/create'
end

post '/users/create' do
  User.create(username: params[:username], password: params[:password])
  redirect "/?create=success"
end

get '/users/logout' do
  session[:username] = nil
  redirect "/"
end