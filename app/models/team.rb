class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :home_matches, class_name: 'Match', foreign_key: 'team1_id'
  has_many :away_matches, class_name: 'Match', foreign_key: 'team2_id'
  
  validates :name, presence: true, uniqueness: true
  
  def matches
    Match.where("team1_id = ? OR team2_id = ?", id, id)
  end
  
  def ready_for_match?
    players.count == 5
  end
  
  def full?
    players.count >= 5
  end
end