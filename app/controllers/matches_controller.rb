class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, except: [:index, :show]
  
  def index
    @matches = Match.all.order(date: :desc)
  end

  def show
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      redirect_to @match, notice: 'Match créé avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @match.update(match_params)
      redirect_to @match, notice: 'Match mis à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @match.destroy
    redirect_to matches_url, notice: 'Match supprimé avec succès.'
  end

  private
    def set_match
      @match = Match.find(params[:id])
    end

    def set_teams
      @teams = Team.all
    end

    def match_params
      params.require(:match).permit(:date, :team1_id, :team2_id, :score_team1, :score_team2)
    end
end