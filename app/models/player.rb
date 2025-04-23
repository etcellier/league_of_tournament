class Player < ApplicationRecord
  belongs_to :team
  
  ROLES = ['Toplaner', 'Jungler', 'Midlaner', 'ADC', 'Support']
  
  validates :first_name, :last_name, presence: true
  validates :role, presence: true, inclusion: { in: ROLES }
  validate :team_not_full, on: :create
  
  private
  
  def team_not_full
    if team && team.full?
      errors.add(:team, "a déjà 5 joueurs")
    end
  end
end