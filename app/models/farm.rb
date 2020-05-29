class Farm < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def total
    scores = []
    Scoring.where(farm_id: self.id).each do |note| 
      scores << note.score
    end
    scores.sum / scores.count
  end
end
