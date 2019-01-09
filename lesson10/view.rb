class View
  def input_name
    puts 'Input your Name:'
    gets.strip
  end

  def input_action
    puts 'Select an action:'
    puts '1 - Miss'
    puts '2 - Take card'
    puts '3 - Open cards'
    gets.strip.to_i
  end

  def show_user_cards(user, values)
    puts "#{user.name} cards (#{values} values): "
  end

  def show_dealer_cards(values = nil)
    if values
      puts "dealer cards (#{values} values): "
    else
      puts 'dealer cards: '
    end
  end

  def show_card(card)
    print "#{card.name} #{card.lear} "
  end

  def show_dealer_skipped_card
    print '* '
  end

  def empty_string
    puts ''
  end

  def show_money(user, dealer)
    puts "#{user.name} money: #{user.money}"
    puts "dealer money: #{dealer.money}"
  end

  def wrong_number
    puts 'You inputed wrong number!'
  end

  def play_again
    puts 'Do you want to play again? (please, input: Y/N)'
    gets.strip.downcase
  end
end
