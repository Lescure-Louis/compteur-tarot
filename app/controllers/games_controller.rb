class GamesController < ApplicationController
  def create
    @new_game = Game.new(game_params)
    @new_game.start = Date.today
    @new_game.save
    redirect_to game_path(@new_game)
  end

  def new
    @game = Game.new
    4.times { @game.players.build }
  end

  def show
    @game = Game.find(params[:id])
  end
  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:date, players_attributes: [:name])
  end
end
