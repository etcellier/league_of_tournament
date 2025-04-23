class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  before_action :set_teams, only: [:new, :edit, :create, :update]

  def index
    @players = Player.all
  end

  def show
  end

  def new
    @player = Player.new
    @player.team_id = params[:team_id] if params[:team_id]
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to @player, notice: 'Joueur ajouté avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @player.update(player_params)
      redirect_to @player, notice: 'Joueur mis à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @player.destroy
    redirect_to players_url, notice: 'Joueur supprimé avec succès.'
  end

  private
    def set_player
      @player = Player.find(params[:id])
    end

    def set_teams
      @teams = Team.all
    end

    def player_params
      params.require(:player).permit(:first_name, :last_name, :role, :team_id)
    end
end 