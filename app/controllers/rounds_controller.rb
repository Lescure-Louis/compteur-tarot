class RoundsController < ApplicationController
  def new
    @round = Round.new
    @round.game = Game.find(params[:game])
  end

  def create
    @round = Round.new(round_params)
    @round.player = Player.find(params[:round][:player_id])
    @round.game = Game.find(params[:round][:game_id])
    @round.game.players.each { |player| update_player_score(player)}
    if @round.save
      redirect_to game_path(@round.game)
    else
      render "new"
    end
  end


  private

  def round_params
    params.require(:round).permit(:player, :game, :bouts, :defensePts, :contract, :attackPts, :petitAuBout, :levee, :chelem)
  end

  def update_player_score(player)
    points = calculate_score
    player == @round.player ? player.score += points : player.score += 0 - points
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

  def calculate_score
    points = calculate_point_value(@round.attackPts) + 25
    points += 10 if @round.petitAuBout
    points *= 2 if @round.contract == "Garde"
    points *= 4 if @round.contract == "Garde Sans"
    points *= 6 if @round.contract == "Garde Contre"
    points
  end
end

