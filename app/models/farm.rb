class Farm < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def average(scope)
    notes = []
    Scoring.where(criterion_id: Criterion.where(category_id: Category.find_by(name: scope)), farm_id: self.id).each do |critere|
      notes << critere.score
    end
    notes.sum / notes.count
  end

  def total
    scores = []
    Scoring.where(farm_id: self.id).each do |note| 
      scores << note.score
    end
    scores.sum / scores.count
  end
end
