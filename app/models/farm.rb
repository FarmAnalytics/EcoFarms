class Farm < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def average(scope)
    note = []
    Scoring.where(criterion_id: Criterion.where(category_id: Category.find_by(name: scope)), farm_id: self.id).each do |critere|
      note << critere.score
    end
    return note.sum / note.count
  end

  # def total
  #   tot = []
  #   Scoring.where(criterion_id: Criterion.where(category_id: Category.find_by(farm_id: self.id)).each do |critere|
  #     note << critere.score
  #   end
  #   return tot.sum / tot.count
  # end
end
