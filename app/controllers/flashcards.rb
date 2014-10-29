get '/flashcards' do
  # Look in app/views/index.erb
  if session[:username] == nil
    redirect "/?notice=no_login"
  else
    @decks = Deck.all
    user = User.find_by(username: session[:username])
    @rounds = user.rounds


  erb :'flashcards/index'
  end
end


get '/flashcards/:id' do
  # Look in app/views/index.erb
  if session[:username] == nil
    redirect "/?notice=no_login"
  else
    # byebug
    user = User.find_by(username: session[:username])
    round = user.rounds.new
    round.save
    session[:round] = round.id
    @correct = 0
    @total = 0
    @card = Deck.find(params[:id]).cards.sample
    @message = ""
    @next_question = ""
    @previous_answer = ""
    @previous_question = ""
    erb :'flashcards/guess'
  end
end

post '/flashcards/:id/answer' do
  previous_card = Card.find(params[:card_id])
  if params[:answer].downcase == previous_card.answer.downcase
    @message = "Correct answer!"
    @color = "green"

# byebug
    Guess.create(round_id: session[:round], correct: true)

  else
    @message = "Wrong! The Answer is"
    @color = "red"

    Guess.create(round_id: session[:round], correct: false)

  end
      @previous_answer = previous_card.answer
    @previous_question = "Definition: " + previous_card.question
  @next_question = "Next Question: "
    @correct = Guess.where(round_id: session[:round], correct: true).length
    @total = Guess.where(round_id: session[:round]).length

    @card = Deck.find(params[:id]).cards.sample

    erb :'flashcards/guess'
end