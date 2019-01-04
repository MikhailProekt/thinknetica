class Operator
  def manage
    @view = View.new
    name = @view.input_name
    @user = User.new(name)
    @dealer = Dealer.new
    @deck = Deck.new
    @bank = Bank.new
    start_game
  end

  def start_game
    @user.used_cards = []
    @dealer.used_cards = []
    @user.money -= @bank.rate
    @dealer.money -= @bank.rate
    @bank.money += @bank.rate * 2
    2.times { take_card(@user) }
    2.times { take_card(@dealer) }
    show_cards
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
    gamer.used_cards << @deck.cards.pop
  end

  def show_cards
    @view.show_user_cards(@user, @user.count_values)
    @user.used_cards.each { |card| @view.show_card(card) }
    puts ''
    @view.show_dealer_cards
    @dealer.used_cards.each { |_card| @view.show_dealer_skipped_card }
    puts ''
  end

  def show_money
    @view.show_money(@user, @dealer)
  end

  def dealer_game
    take_card(@dealer) if @dealer.count_values < 17
    if @user.used_cards.size == 3 || @dealer.used_cards.size == 3
      open_cards
    else
      show_cards
    end
  end

  def add_card
    take_card(@user)
    dealer_game
  end

  def open_cards
    user_values = @user.count_values
    dealer_values = @dealer.count_values
    @view.show_user_cards(@user, user_values)
    @user.used_cards.each { |card| @view.show_card(card) }
    puts ''
    @view.show_dealer_cards(dealer_values)
    @dealer.used_cards.each { |card| @view.show_card(card) }
    puts ''
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

  def count_money(user_values, dealer_values)
    if user_values > 21 && dealer_values > 21
      take_money(@user, @bank.money / 2)
      take_money(@dealer, @bank.money / 2)
    elsif user_values > 21 && dealer_values <= 21
      take_money(@dealer, @bank.money)
    elsif user_values <= 21 && dealer_values > 21
      take_money(@user, @bank.money)
    elsif user_values == dealer_values
      take_money(@user, @bank.money / 2)
      take_money(@dealer, @bank.money / 2)
    elsif user_values > dealer_values
      take_money(@user, @bank.money)
    else
      take_money(@dealer, @bank.money)
    end
    bank_zero
  end

  def question
    input = @view.play_again
    start_game if input == 'y'
    abort
  end
end
