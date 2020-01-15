class RoundsController < ApplicationController
  def new
    @round = Round.new
    @round.game = Game.find(params[:game])
  end

  def create
    @round = Round.new(round_params)
    @round.player = Player.find(params[:round][:player_id])
    @round.game = Game.find(params[:round][:game_id])
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
end

