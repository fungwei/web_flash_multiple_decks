def create_users
  User.create(username: "dill", password: "llid")
  User.create(username: "fung", password: "gnuf")
end

def create_deck(title, file)
  temp_deck = Deck.create(title: title)

  definition = ""
  term = ""
  File.open(file) do |f|
    line_count = 0
    f.each_line do |line|
      # puts line_count
    case line_count % 3
    when 0
      definition = line
      # puts definition
    when 1
      term = line.gsub("\n","")
      definition.gsub!("\n","")
      # puts term
      # flashcard = Flashcard.new(definition, term)
      # add_flashcard(flashcard)
      # puts flashcard.complete?
      temp_deck.cards << Card.create(question: definition, answer: term)

    end



    line_count += 1
    end
    # puts @stack.inspect
  end
  # temp_deck.save

end


create_users
create_deck("Ruby Quiz","flashcard_samples.txt")