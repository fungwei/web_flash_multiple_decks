get '/flashcards' do
  # Look in app/views/index.erb
  if session[:username] == nil
    redirect "/?notice=no_login"
  else
    @decks = Deck.all
  erb :'flashcards/index'
  end
end
