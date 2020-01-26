class RoundsController < ApplicationController
  def new
    @round = Round.new
    @round.game = Game.find(params[:game])
  end

  def create
    @round = Round.new(round_params)
    unless params[:round][:player_id].empty?
      @round.player = Player.find(params[:round][:player_id])
    end
    @round.game = Game.find(params[:round][:game_id])
    unless @round.help1.nil?
      @round.levee = @round.help1
    end
    @round.game.players.each { |player| update_player_score(player)}
    write_scores
    if @round.save
      redirect_to game_path(@round.game)
    else
      @round.game = Game.find(params[:round][:game_id])
      render "new"
    end
  end


  private

  def round_params
    params.require(:round).permit(:player, :game, :bouts, :defensePts, :contract, :attackPts, :petitAuBout, :levee, :chelem, :other)
  end

  def update_player_score(player)
    points = calculate_score
    player == @round.player ? player.score += points * 3 : player.score -= points
    player.save
  end

  def calculate_point_value(points)
    if @round.bouts == 0
      return points - 56
    elsif @round.bouts == 1
      return points - 51
    elsif @round.bouts == 2
      return points - 41
    else
      return points - 36
    end
  end


  def add_petit_au_bout(points)
    points += 10 if @round.petitAuBout == "attaque"
    points -= 10 if @round.petitAuBout == "defense"
    points
  end

  def contact_multplier(points)
    points *= 2 if @round.contract == "Garde"
    points *= 4 if @round.contract == "Garde Sans"
    points *= 6 if @round.contract == "Garde Contre"
    points
  end

  def add_levee(points)
    extra = 30 if @round.levee.include? "S"
    extra = 60 if @round.levee.include? "D"
    extra = 90 if @round.levee.include? "T"
    points += extra if @round.levee.include?("atc")
    points -= extra if @round.levee.include?("def")
    points
  end

  def add_chelem(points)
    points += 400 if @round.chelem == "anoncé"
    points += 200 if @round.chelem == "non-anoncé"
    points -= 200 if @round.chelem == "non-réalisé"
    points
  end

  def write_scores
    scores=""
    @round.game.players.each do |player|
      scores << "#{player.name}: #{player.score} |"
    end
    @round.scores = scores
  end


  def calculate_score
    points = calculate_point_value(@round.attackPts)
    points.positive? ? points += 25 : points -= 25
    points = add_petit_au_bout(points)
    points = contact_multplier(points)
    points = add_levee(points)
    points = add_chelem(points)
    points
  end
end

