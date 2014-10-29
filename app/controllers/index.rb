enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end


post '/' do
  # new_user = User.new
  if User.valid?(params[:username])
    new_user = User.where(username: params[:username]).first
    if new_user.authenticate(params[:password])
      'You are logged in'
      session[:username] = params[:username]
      erb :index
    else
      'wrong password'
    end
  else
    'Invalid User'
  end
end

