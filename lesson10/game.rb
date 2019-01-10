class Game
  RATE = 10
  def manage
    @view = View.new
    name = @view.input_name
    @user = User.new(name)
    @dealer = Dealer.new
    @deck = Deck.new
    @bank = Bank.new
    first_turn
  end

  def first_turn
    @user.used_cards = []
    @dealer.used_cards = []
    @user.money -= RATE
    @dealer.money -= RATE
    @bank.money += RATE * 2
    2.times { take_card(@user) }
    2.times { take_card(@dealer) }
    show_cards
    start_game
  end

  def start_game
    loop do
      input = @view.input_action
      case input
      when 1
        dealer_game
      when 2
        add_card
      when 3
        open_cards
      else
        @view.wrong_number
      end
    end
  end

  def take_card(gamer)
    if !@deck.cards.empty?
      gamer.used_cards << @deck.cards.pop
    else
      abort
    end
  end

  def show_cards
    @view.show_user_cards(@user, @user.score)
    @user.used_cards.each { |card| @view.show_card(card) }
    @view.empty_string
    @view.show_dealer_cards
    @view.how_dealer_skipped_card(@dealer.used_cards.size)
    @view.empty_string
  end

  def show_money
    @view.show_money(@user, @dealer)
  end

  def dealer_game
    take_card(@dealer) if @dealer.score < 17
    if @user.used_cards.size == 3 || @dealer.used_cards.size == 3
      open_cards
    else
      show_cards
    end
    start_game
  end

  def add_card
    take_card(@user)
    dealer_game
  end

  def open_cards
    user_values = @user.score
    dealer_values = @dealer.score
    @view.show_user_cards(@user, user_values)
    @user.used_cards.each { |card| @view.show_card(card) }
    @view.empty_string
    @view.show_dealer_cards(dealer_values)
    @dealer.used_cards.each { |card| @view.show_card(card) }
    @view.empty_string
    count_money(user_values, dealer_values)
    show_money
    question
  end

  def take_money(gamer, money)
    gamer.money += money
  end

  def bank_zero
    @bank.money = 0
  end

  def find_winner(user_values, dealer_values)
    return @user if dealer_values > 21
    return @dealer if user_values > 21
    return nil if dealer_values == user_values
    return nil if dealer_values > 21 && user_values > 21

    dealer_values > user_values ? @dealer : @user
  end

  def count_money(user_values, dealer_values)
    winner = find_winner(user_values, dealer_values)
    if winner
      take_money(winner, @bank.money)
    else
      take_money(@user, @bank.money / 2)
      take_money(@dealer, @bank.money / 2)
    end
    bank_zero
  end

  def question
    input = @view.play_again
    first_turn if input == 'y'
    abort
  end
end
