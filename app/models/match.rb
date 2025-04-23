class Match < ApplicationRecord
  belongs_to :team1, class_name: 'Team'
  belongs_to :team2, class_name: 'Team'
  
  validates :date, presence: true
  validates :team1_id, :team2_id, presence: true
  validate :teams_are_different
  validate :teams_are_ready
  
  def winner
    return nil if score_team1.nil? || score_team2.nil?
    return nil if score_team1 == score_team2
    score_team1 > score_team2 ? team1 : team2
  end
  
  def loser
    return nil if score_team1.nil? || score_team2.nil?
    return nil if score_team1 == score_team2
    score_team1 < score_team2 ? team1 : team2
  end
  
  def draw?
    score_team1.present? && score_team2.present? && score_team1 == score_team2
  end
  
  def result_text
    if score_team1.nil? || score_team2.nil?
      "Match non joué"
    elsif draw?
      "Match nul"
    else
      "#{winner.name} a gagné contre #{loser.name}"
    end
  end
  
  private
  
  def teams_are_different
    if team1_id == team2_id
      errors.add(:base, "Les deux équipes doivent être différentes")
    end
  end
  
  def teams_are_ready
    if team1 && !team1.ready_for_match?
      errors.add(:team1, "n'est pas prête pour un match (l'équipe doit avoir 5 joueurs)")
    end
    
    if team2 && !team2.ready_for_match?
      errors.add(:team2, "n'est pas prête pour un match (l'équipe doit avoir 5 joueurs)")
    end
  end
end